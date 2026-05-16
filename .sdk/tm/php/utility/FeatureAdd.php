<?php
declare(strict_types=1);

// StrictlyBetter SDK utility: feature_add

class StrictlyBetterFeatureAdd
{
    public static function call(StrictlyBetterContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
