<?php
declare(strict_types=1);

// StrictlyBetter SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class StrictlyBetterMakeContext
{
    public static function call(array $ctxmap, ?StrictlyBetterContext $basectx): StrictlyBetterContext
    {
        return new StrictlyBetterContext($ctxmap, $basectx);
    }
}
