# Typed models for the StrictlyBetter SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class FunctionalReprint:
    functionally_identical: Optional[bool] = None
    original_card: Optional[str] = None
    original_set_code: Optional[str] = None
    reprint_card: Optional[str] = None
    reprint_set_code: Optional[str] = None


@dataclass
class FunctionalReprintListMatch:
    functionally_identical: Optional[bool] = None
    original_card: Optional[str] = None
    original_set_code: Optional[str] = None
    reprint_card: Optional[str] = None
    reprint_set_code: Optional[str] = None


@dataclass
class Obsolete:
    id: Optional[str] = None
    mana_cost: Optional[str] = None
    name: Optional[str] = None
    obsolete: Optional[bool] = None
    power: Optional[str] = None
    rarity: Optional[str] = None
    set_code: Optional[str] = None
    text: Optional[str] = None
    toughness: Optional[str] = None
    type: Optional[str] = None


@dataclass
class ObsoleteListMatch:
    id: Optional[str] = None
    mana_cost: Optional[str] = None
    name: Optional[str] = None
    obsolete: Optional[bool] = None
    power: Optional[str] = None
    rarity: Optional[str] = None
    set_code: Optional[str] = None
    text: Optional[str] = None
    toughness: Optional[str] = None
    type: Optional[str] = None

