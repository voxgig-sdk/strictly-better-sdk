# StrictlyBetter SDK utility: feature_add
module StrictlyBetterUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
