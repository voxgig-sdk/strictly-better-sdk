# StrictlyBetter SDK utility: make_context

from strictlybetter_sdk.core.context import StrictlyBetterContext


def make_context_util(ctxmap, basectx):
    return StrictlyBetterContext(ctxmap, basectx)
