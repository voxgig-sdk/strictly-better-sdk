-- Typed models for the StrictlyBetter SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class FunctionalReprint
---@field functionallyIdentical? boolean
---@field originalCard? string
---@field originalSetCode? string
---@field reprintCard? string
---@field reprintSetCode? string

---@class FunctionalReprintListMatch
---@field card_name? string
---@field limit? number
---@field offset? number

---@class Obsolete
---@field id? string
---@field manaCost? string
---@field name? string
---@field obsolete? boolean
---@field power? string
---@field rarity? string
---@field setCode? string
---@field text? string
---@field toughness? string
---@field type? string

---@class ObsoleteListMatch
---@field limit? number
---@field offset? number
---@field search? string

local M = {}

return M
