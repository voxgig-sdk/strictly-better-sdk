# StrictlyBetter SDK feature factory

from strictlybetter_sdk.feature.base_feature import StrictlyBetterBaseFeature
from strictlybetter_sdk.feature.test_feature import StrictlyBetterTestFeature


def _make_feature(name):
    features = {
        "base": lambda: StrictlyBetterBaseFeature(),
        "test": lambda: StrictlyBetterTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
