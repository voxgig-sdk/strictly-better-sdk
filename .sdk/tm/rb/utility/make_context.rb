# StrictlyBetter SDK utility: make_context
require_relative '../core/context'
module StrictlyBetterUtilities
  MakeContext = ->(ctxmap, basectx) {
    StrictlyBetterContext.new(ctxmap, basectx)
  }
end
