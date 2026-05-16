# StrictlyBetter SDK utility: prepare_body
module StrictlyBetterUtilities
  PrepareBody = ->(ctx) {
    ctx.op.input == "data" ? ctx.utility.transform_request.call(ctx) : nil
  }
end
