# StrictlyBetter SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module StrictlyBetterFeatures
  def self.make_feature(name)
    case name
    when "base"
      StrictlyBetterBaseFeature.new
    when "test"
      StrictlyBetterTestFeature.new
    else
      StrictlyBetterBaseFeature.new
    end
  end
end
