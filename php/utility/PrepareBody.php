<?php
declare(strict_types=1);

// StrictlyBetter SDK utility: prepare_body

class StrictlyBetterPrepareBody
{
    public static function call(StrictlyBetterContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
