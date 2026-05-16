<?php
declare(strict_types=1);

// StrictlyBetter SDK utility: result_headers

class StrictlyBetterResultHeaders
{
    public static function call(StrictlyBetterContext $ctx): ?StrictlyBetterResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
