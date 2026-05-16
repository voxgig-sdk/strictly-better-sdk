# StrictlyBetter SDK exists test

require "minitest/autorun"
require_relative "../StrictlyBetter_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = StrictlyBetterSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
