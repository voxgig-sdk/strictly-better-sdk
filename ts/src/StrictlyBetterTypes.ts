// Typed models for the StrictlyBetter SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface FunctionalReprint {
  functionally_identical?: boolean
  original_card?: string
  original_set_code?: string
  reprint_card?: string
  reprint_set_code?: string
}

export type FunctionalReprintListMatch = Partial<FunctionalReprint>

export interface Obsolete {
  id?: string
  mana_cost?: string
  name?: string
  obsolete?: boolean
  power?: string
  rarity?: string
  set_code?: string
  text?: string
  toughness?: string
  type?: string
}

export type ObsoleteListMatch = Partial<Obsolete>

