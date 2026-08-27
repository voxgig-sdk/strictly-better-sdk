package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "StrictlyBetter",
			"slug": "strictly-better",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://www.strictlybetter.eu",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"functional_reprint": map[string]any{},
				"obsolete": map[string]any{},
			},
		},
		"entity": map[string]any{
			"functional_reprint": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "functionallyIdentical",
						"short": "Whether the reprint is functionally identical",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "originalCard",
						"short": "Name of the original card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalSetCode",
						"short": "Set code of the original card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reprintCard",
						"short": "Name of the reprint card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reprintSetCode",
						"short": "Set code of the reprint",
						"type": "`$STRING`",
					},
				},
				"name": "functional_reprint",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "card_name",
											"orig": "card_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "offset",
											"orig": "offset",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/functional_reprints",
								"parts": []any{
									"api",
									"functional_reprints",
								},
								"select": map[string]any{
									"exist": []any{
										"card_name",
										"limit",
										"offset",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"obsolete": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"short": "Unique identifier for the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "manaCost",
						"short": "Mana cost of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "Name of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "obsolete",
						"short": "Whether the card is considered obsolete",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "power",
						"short": "Power value for creatures",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "rarity",
						"short": "Card rarity",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "setCode",
						"short": "Set code where the card appears",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "text",
						"short": "Card text and abilities",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "toughness",
						"short": "Toughness value for creatures",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"short": "Card type",
						"type": "`$STRING`",
					},
				},
				"name": "obsolete",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "offset",
											"orig": "offset",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "search",
											"orig": "search",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/api/obsoletes",
								"parts": []any{
									"api",
									"obsoletes",
								},
								"select": map[string]any{
									"exist": []any{
										"limit",
										"offset",
										"search",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
