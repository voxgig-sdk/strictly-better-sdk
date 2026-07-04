<?php
declare(strict_types=1);

// Typed models for the StrictlyBetter SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** FunctionalReprint entity data model. */
class FunctionalReprint
{
    public ?bool $functionally_identical = null;
    public ?string $original_card = null;
    public ?string $original_set_code = null;
    public ?string $reprint_card = null;
    public ?string $reprint_set_code = null;
}

/** Match filter for FunctionalReprint#list (any subset of FunctionalReprint fields). */
class FunctionalReprintListMatch
{
    public ?bool $functionally_identical = null;
    public ?string $original_card = null;
    public ?string $original_set_code = null;
    public ?string $reprint_card = null;
    public ?string $reprint_set_code = null;
}

/** Obsolete entity data model. */
class Obsolete
{
    public ?string $id = null;
    public ?string $mana_cost = null;
    public ?string $name = null;
    public ?bool $obsolete = null;
    public ?string $power = null;
    public ?string $rarity = null;
    public ?string $set_code = null;
    public ?string $text = null;
    public ?string $toughness = null;
    public ?string $type = null;
}

/** Match filter for Obsolete#list (any subset of Obsolete fields). */
class ObsoleteListMatch
{
    public ?string $id = null;
    public ?string $mana_cost = null;
    public ?string $name = null;
    public ?bool $obsolete = null;
    public ?string $power = null;
    public ?string $rarity = null;
    public ?string $set_code = null;
    public ?string $text = null;
    public ?string $toughness = null;
    public ?string $type = null;
}

