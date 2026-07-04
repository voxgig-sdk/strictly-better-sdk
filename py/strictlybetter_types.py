# Typed models for the StrictlyBetter SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class FunctionalReprint(TypedDict, total=False):
    functionally_identical: bool
    original_card: str
    original_set_code: str
    reprint_card: str
    reprint_set_code: str


class FunctionalReprintListMatch(TypedDict, total=False):
    functionally_identical: bool
    original_card: str
    original_set_code: str
    reprint_card: str
    reprint_set_code: str


class Obsolete(TypedDict, total=False):
    id: str
    mana_cost: str
    name: str
    obsolete: bool
    power: str
    rarity: str
    set_code: str
    text: str
    toughness: str
    type: str


class ObsoleteListMatch(TypedDict, total=False):
    id: str
    mana_cost: str
    name: str
    obsolete: bool
    power: str
    rarity: str
    set_code: str
    text: str
    toughness: str
    type: str
