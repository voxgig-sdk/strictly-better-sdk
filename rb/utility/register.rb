# StrictlyBetter SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

StrictlyBetterUtility.registrar = ->(u) {
  u.clean = StrictlyBetterUtilities::Clean
  u.done = StrictlyBetterUtilities::Done
  u.make_error = StrictlyBetterUtilities::MakeError
  u.feature_add = StrictlyBetterUtilities::FeatureAdd
  u.feature_hook = StrictlyBetterUtilities::FeatureHook
  u.feature_init = StrictlyBetterUtilities::FeatureInit
  u.fetcher = StrictlyBetterUtilities::Fetcher
  u.make_fetch_def = StrictlyBetterUtilities::MakeFetchDef
  u.make_context = StrictlyBetterUtilities::MakeContext
  u.make_options = StrictlyBetterUtilities::MakeOptions
  u.make_request = StrictlyBetterUtilities::MakeRequest
  u.make_response = StrictlyBetterUtilities::MakeResponse
  u.make_result = StrictlyBetterUtilities::MakeResult
  u.make_point = StrictlyBetterUtilities::MakePoint
  u.make_spec = StrictlyBetterUtilities::MakeSpec
  u.make_url = StrictlyBetterUtilities::MakeUrl
  u.param = StrictlyBetterUtilities::Param
  u.prepare_auth = StrictlyBetterUtilities::PrepareAuth
  u.prepare_body = StrictlyBetterUtilities::PrepareBody
  u.prepare_headers = StrictlyBetterUtilities::PrepareHeaders
  u.prepare_method = StrictlyBetterUtilities::PrepareMethod
  u.prepare_params = StrictlyBetterUtilities::PrepareParams
  u.prepare_path = StrictlyBetterUtilities::PreparePath
  u.prepare_query = StrictlyBetterUtilities::PrepareQuery
  u.result_basic = StrictlyBetterUtilities::ResultBasic
  u.result_body = StrictlyBetterUtilities::ResultBody
  u.result_headers = StrictlyBetterUtilities::ResultHeaders
  u.transform_request = StrictlyBetterUtilities::TransformRequest
  u.transform_response = StrictlyBetterUtilities::TransformResponse
}
