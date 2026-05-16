<?php
declare(strict_types=1);

// StrictlyBetter SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

StrictlyBetterUtility::setRegistrar(function (StrictlyBetterUtility $u): void {
    $u->clean = [StrictlyBetterClean::class, 'call'];
    $u->done = [StrictlyBetterDone::class, 'call'];
    $u->make_error = [StrictlyBetterMakeError::class, 'call'];
    $u->feature_add = [StrictlyBetterFeatureAdd::class, 'call'];
    $u->feature_hook = [StrictlyBetterFeatureHook::class, 'call'];
    $u->feature_init = [StrictlyBetterFeatureInit::class, 'call'];
    $u->fetcher = [StrictlyBetterFetcher::class, 'call'];
    $u->make_fetch_def = [StrictlyBetterMakeFetchDef::class, 'call'];
    $u->make_context = [StrictlyBetterMakeContext::class, 'call'];
    $u->make_options = [StrictlyBetterMakeOptions::class, 'call'];
    $u->make_request = [StrictlyBetterMakeRequest::class, 'call'];
    $u->make_response = [StrictlyBetterMakeResponse::class, 'call'];
    $u->make_result = [StrictlyBetterMakeResult::class, 'call'];
    $u->make_point = [StrictlyBetterMakePoint::class, 'call'];
    $u->make_spec = [StrictlyBetterMakeSpec::class, 'call'];
    $u->make_url = [StrictlyBetterMakeUrl::class, 'call'];
    $u->param = [StrictlyBetterParam::class, 'call'];
    $u->prepare_auth = [StrictlyBetterPrepareAuth::class, 'call'];
    $u->prepare_body = [StrictlyBetterPrepareBody::class, 'call'];
    $u->prepare_headers = [StrictlyBetterPrepareHeaders::class, 'call'];
    $u->prepare_method = [StrictlyBetterPrepareMethod::class, 'call'];
    $u->prepare_params = [StrictlyBetterPrepareParams::class, 'call'];
    $u->prepare_path = [StrictlyBetterPreparePath::class, 'call'];
    $u->prepare_query = [StrictlyBetterPrepareQuery::class, 'call'];
    $u->result_basic = [StrictlyBetterResultBasic::class, 'call'];
    $u->result_body = [StrictlyBetterResultBody::class, 'call'];
    $u->result_headers = [StrictlyBetterResultHeaders::class, 'call'];
    $u->transform_request = [StrictlyBetterTransformRequest::class, 'call'];
    $u->transform_response = [StrictlyBetterTransformResponse::class, 'call'];
});
