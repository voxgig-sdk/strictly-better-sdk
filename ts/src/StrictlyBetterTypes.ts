// Typed models for the StrictlyBetter SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface FunctionalReprint {
  functionallyIdentical?: boolean
  originalCard?: string
  originalSetCode?: string
  reprintCard?: string
  reprintSetCode?: string
}

export interface FunctionalReprintListMatch {
  functionallyIdentical?: boolean
  originalCard?: string
  originalSetCode?: string
  reprintCard?: string
  reprintSetCode?: string
}

export interface Obsolete {
  id?: string
  manaCost?: string
  name?: string
  obsolete?: boolean
  power?: string
  rarity?: string
  setCode?: string
  text?: string
  toughness?: string
  type?: string
}

export interface ObsoleteListMatch {
  id?: string
  manaCost?: string
  name?: string
  obsolete?: boolean
  power?: string
  rarity?: string
  setCode?: string
  text?: string
  toughness?: string
  type?: string
}

