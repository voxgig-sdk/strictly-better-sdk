package voxgigstrictlybettersdk

import (
	"github.com/voxgig-sdk/strictly-better-sdk/core"
	"github.com/voxgig-sdk/strictly-better-sdk/entity"
	"github.com/voxgig-sdk/strictly-better-sdk/feature"
	_ "github.com/voxgig-sdk/strictly-better-sdk/utility"
)

// Type aliases preserve external API.
type StrictlyBetterSDK = core.StrictlyBetterSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type StrictlyBetterEntity = core.StrictlyBetterEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type StrictlyBetterError = core.StrictlyBetterError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewCardEntityFunc = func(client *core.StrictlyBetterSDK, entopts map[string]any) core.StrictlyBetterEntity {
		return entity.NewCardEntity(client, entopts)
	}
	core.NewReprintEntityFunc = func(client *core.StrictlyBetterSDK, entopts map[string]any) core.StrictlyBetterEntity {
		return entity.NewReprintEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewStrictlyBetterSDK = core.NewStrictlyBetterSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
