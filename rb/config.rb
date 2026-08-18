# StrictlyBetter SDK configuration

module StrictlyBetterConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "StrictlyBetter",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://www.strictlybetter.eu",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "functional_reprint" => {},
          "obsolete" => {},
        },
      },
      "entity" => {
        "functional_reprint" => {
          "fields" => [
            {
              "name" => "functionallyIdentical",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "originalCard",
              "type" => "`$STRING`",
            },
            {
              "name" => "originalSetCode",
              "type" => "`$STRING`",
            },
            {
              "name" => "reprintCard",
              "type" => "`$STRING`",
            },
            {
              "name" => "reprintSetCode",
              "type" => "`$STRING`",
            },
          ],
          "name" => "functional_reprint",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "card_name",
                        "orig" => "card_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 100,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "offset",
                        "orig" => "offset",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/functional_reprints",
                  "parts" => [
                    "api",
                    "functional_reprints",
                  ],
                  "select" => {
                    "exist" => [
                      "card_name",
                      "limit",
                      "offset",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "obsolete" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "manaCost",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "obsolete",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "power",
              "type" => "`$STRING`",
            },
            {
              "name" => "rarity",
              "type" => "`$STRING`",
            },
            {
              "name" => "setCode",
              "type" => "`$STRING`",
            },
            {
              "name" => "text",
              "type" => "`$STRING`",
            },
            {
              "name" => "toughness",
              "type" => "`$STRING`",
            },
            {
              "name" => "type",
              "type" => "`$STRING`",
            },
          ],
          "name" => "obsolete",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => 100,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "offset",
                        "orig" => "offset",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "search",
                        "orig" => "search",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/obsoletes",
                  "parts" => [
                    "api",
                    "obsoletes",
                  ],
                  "select" => {
                    "exist" => [
                      "limit",
                      "offset",
                      "search",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    StrictlyBetterFeatures.make_feature(name)
  end
end
