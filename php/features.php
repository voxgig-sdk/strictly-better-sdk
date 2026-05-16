<?php
declare(strict_types=1);

// StrictlyBetter SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class StrictlyBetterFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new StrictlyBetterBaseFeature();
            case "test":
                return new StrictlyBetterTestFeature();
            default:
                return new StrictlyBetterBaseFeature();
        }
    }
}
