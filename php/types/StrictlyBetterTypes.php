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
    public ?bool $functionallyIdentical = null;
    public ?string $originalCard = null;
    public ?string $originalSetCode = null;
    public ?string $reprintCard = null;
    public ?string $reprintSetCode = null;
}

/** Request payload for FunctionalReprint#list. */
class FunctionalReprintListMatch
{
    public ?bool $functionallyIdentical = null;
    public ?string $originalCard = null;
    public ?string $originalSetCode = null;
    public ?string $reprintCard = null;
    public ?string $reprintSetCode = null;
}

/** Obsolete entity data model. */
class Obsolete
{
    public ?string $id = null;
    public ?string $manaCost = null;
    public ?string $name = null;
    public ?bool $obsolete = null;
    public ?string $power = null;
    public ?string $rarity = null;
    public ?string $setCode = null;
    public ?string $text = null;
    public ?string $toughness = null;
    public ?string $type = null;
}

/** Request payload for Obsolete#list. */
class ObsoleteListMatch
{
    public ?string $id = null;
    public ?string $manaCost = null;
    public ?string $name = null;
    public ?bool $obsolete = null;
    public ?string $power = null;
    public ?string $rarity = null;
    public ?string $setCode = null;
    public ?string $text = null;
    public ?string $toughness = null;
    public ?string $type = null;
}

