// Typed models for the StrictlyBetter SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// FunctionalReprint is the typed data model for the functional_reprint entity.
type FunctionalReprint struct {
	FunctionallyIdentical *bool `json:"functionally_identical,omitempty"`
	OriginalCard *string `json:"original_card,omitempty"`
	OriginalSetCode *string `json:"original_set_code,omitempty"`
	ReprintCard *string `json:"reprint_card,omitempty"`
	ReprintSetCode *string `json:"reprint_set_code,omitempty"`
}

// FunctionalReprintListMatch mirrors the functional_reprint fields as an all-optional match
// filter (Go analog of Partial<FunctionalReprint>).
type FunctionalReprintListMatch struct {
	FunctionallyIdentical *bool `json:"functionally_identical,omitempty"`
	OriginalCard *string `json:"original_card,omitempty"`
	OriginalSetCode *string `json:"original_set_code,omitempty"`
	ReprintCard *string `json:"reprint_card,omitempty"`
	ReprintSetCode *string `json:"reprint_set_code,omitempty"`
}

// Obsolete is the typed data model for the obsolete entity.
type Obsolete struct {
	Id *string `json:"id,omitempty"`
	ManaCost *string `json:"mana_cost,omitempty"`
	Name *string `json:"name,omitempty"`
	Obsolete *bool `json:"obsolete,omitempty"`
	Power *string `json:"power,omitempty"`
	Rarity *string `json:"rarity,omitempty"`
	SetCode *string `json:"set_code,omitempty"`
	Text *string `json:"text,omitempty"`
	Toughness *string `json:"toughness,omitempty"`
	Type *string `json:"type,omitempty"`
}

// ObsoleteListMatch mirrors the obsolete fields as an all-optional match
// filter (Go analog of Partial<Obsolete>).
type ObsoleteListMatch struct {
	Id *string `json:"id,omitempty"`
	ManaCost *string `json:"mana_cost,omitempty"`
	Name *string `json:"name,omitempty"`
	Obsolete *bool `json:"obsolete,omitempty"`
	Power *string `json:"power,omitempty"`
	Rarity *string `json:"rarity,omitempty"`
	SetCode *string `json:"set_code,omitempty"`
	Text *string `json:"text,omitempty"`
	Toughness *string `json:"toughness,omitempty"`
	Type *string `json:"type,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
