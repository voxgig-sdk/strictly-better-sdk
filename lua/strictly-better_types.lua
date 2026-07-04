-- Typed models for the StrictlyBetter SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class FunctionalReprint
---@field functionally_identical? boolean
---@field original_card? string
---@field original_set_code? string
---@field reprint_card? string
---@field reprint_set_code? string

---@class FunctionalReprintListMatch

---@class Obsolete
---@field id? string
---@field mana_cost? string
---@field name? string
---@field obsolete? boolean
---@field power? string
---@field rarity? string
---@field set_code? string
---@field text? string
---@field toughness? string
---@field type? string

---@class ObsoleteListMatch

local M = {}

return M
