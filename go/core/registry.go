package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewFunctionalReprintEntityFunc func(client *StrictlyBetterSDK, entopts map[string]any) StrictlyBetterEntity

var NewObsoleteEntityFunc func(client *StrictlyBetterSDK, entopts map[string]any) StrictlyBetterEntity

