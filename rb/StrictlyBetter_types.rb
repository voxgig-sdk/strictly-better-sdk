# frozen_string_literal: true

# Typed models for the StrictlyBetter SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# FunctionalReprint entity data model.
#
# @!attribute [rw] functionally_identical
#   @return [Boolean, nil]
#
# @!attribute [rw] original_card
#   @return [String, nil]
#
# @!attribute [rw] original_set_code
#   @return [String, nil]
#
# @!attribute [rw] reprint_card
#   @return [String, nil]
#
# @!attribute [rw] reprint_set_code
#   @return [String, nil]
FunctionalReprint = Struct.new(
  :functionally_identical,
  :original_card,
  :original_set_code,
  :reprint_card,
  :reprint_set_code,
  keyword_init: true
)

# Request payload for FunctionalReprint#list.
#
# @!attribute [rw] functionally_identical
#   @return [Boolean, nil]
#
# @!attribute [rw] original_card
#   @return [String, nil]
#
# @!attribute [rw] original_set_code
#   @return [String, nil]
#
# @!attribute [rw] reprint_card
#   @return [String, nil]
#
# @!attribute [rw] reprint_set_code
#   @return [String, nil]
FunctionalReprintListMatch = Struct.new(
  :functionally_identical,
  :original_card,
  :original_set_code,
  :reprint_card,
  :reprint_set_code,
  keyword_init: true
)

# Obsolete entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] mana_cost
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] obsolete
#   @return [Boolean, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] set_code
#   @return [String, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] toughness
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
Obsolete = Struct.new(
  :id,
  :mana_cost,
  :name,
  :obsolete,
  :power,
  :rarity,
  :set_code,
  :text,
  :toughness,
  :type,
  keyword_init: true
)

# Request payload for Obsolete#list.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] mana_cost
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] obsolete
#   @return [Boolean, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] set_code
#   @return [String, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] toughness
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
ObsoleteListMatch = Struct.new(
  :id,
  :mana_cost,
  :name,
  :obsolete,
  :power,
  :rarity,
  :set_code,
  :text,
  :toughness,
  :type,
  keyword_init: true
)

