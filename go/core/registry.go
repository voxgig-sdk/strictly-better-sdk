package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewCardEntityFunc func(client *StrictlyBetterSDK, entopts map[string]any) StrictlyBetterEntity

var NewReprintEntityFunc func(client *StrictlyBetterSDK, entopts map[string]any) StrictlyBetterEntity

