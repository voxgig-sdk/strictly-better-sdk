# Obsolete entity test

require "minitest/autorun"
require "json"
require_relative "../StrictlyBetter_sdk"
require_relative "runner"

class ObsoleteEntityTest < Minitest::Test
  def test_create_instance
    testsdk = StrictlyBetterSDK.test(nil, nil)
    ent = testsdk.Obsolete(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = obsolete_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["list"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "obsolete." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set STRICTLYBETTER_TEST_OBSOLETE_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    obsolete_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.obsolete")))
    obsolete_ref01_data = nil
    if obsolete_ref01_data_raw.length > 0
      obsolete_ref01_data = Helpers.to_map(obsolete_ref01_data_raw[0][1])
    end

    # LIST
    obsolete_ref01_ent = client.Obsolete(nil)
    obsolete_ref01_match = {}

    obsolete_ref01_list_result, err = obsolete_ref01_ent.list(obsolete_ref01_match, nil)
    assert_nil err
    assert obsolete_ref01_list_result.is_a?(Array)

  end
end

def obsolete_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "obsolete", "ObsoleteTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = StrictlyBetterSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["obsolete01", "obsolete02", "obsolete03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["STRICTLYBETTER_TEST_OBSOLETE_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "STRICTLYBETTER_TEST_OBSOLETE_ENTID" => idmap,
    "STRICTLYBETTER_TEST_LIVE" => "FALSE",
    "STRICTLYBETTER_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["STRICTLYBETTER_TEST_OBSOLETE_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["STRICTLYBETTER_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = StrictlyBetterSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["STRICTLYBETTER_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["STRICTLYBETTER_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
