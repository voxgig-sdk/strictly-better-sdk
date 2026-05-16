<?php
declare(strict_types=1);

// StrictlyBetter SDK utility: result_body

class StrictlyBetterResultBody
{
    public static function call(StrictlyBetterContext $ctx): ?StrictlyBetterResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
