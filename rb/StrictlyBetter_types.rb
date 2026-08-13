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
# @!attribute [rw] functionallyIdentical
#   @return [Boolean, nil]
#
# @!attribute [rw] originalCard
#   @return [String, nil]
#
# @!attribute [rw] originalSetCode
#   @return [String, nil]
#
# @!attribute [rw] reprintCard
#   @return [String, nil]
#
# @!attribute [rw] reprintSetCode
#   @return [String, nil]
FunctionalReprint = Struct.new(
  :functionallyIdentical,
  :originalCard,
  :originalSetCode,
  :reprintCard,
  :reprintSetCode,
  keyword_init: true
)

# Request payload for FunctionalReprint#list.
#
# @!attribute [rw] functionallyIdentical
#   @return [Boolean, nil]
#
# @!attribute [rw] originalCard
#   @return [String, nil]
#
# @!attribute [rw] originalSetCode
#   @return [String, nil]
#
# @!attribute [rw] reprintCard
#   @return [String, nil]
#
# @!attribute [rw] reprintSetCode
#   @return [String, nil]
FunctionalReprintListMatch = Struct.new(
  :functionallyIdentical,
  :originalCard,
  :originalSetCode,
  :reprintCard,
  :reprintSetCode,
  keyword_init: true
)

# Obsolete entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] manaCost
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
# @!attribute [rw] setCode
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
  :manaCost,
  :name,
  :obsolete,
  :power,
  :rarity,
  :setCode,
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
# @!attribute [rw] manaCost
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
# @!attribute [rw] setCode
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
  :manaCost,
  :name,
  :obsolete,
  :power,
  :rarity,
  :setCode,
  :text,
  :toughness,
  :type,
  keyword_init: true
)

