
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'StrictlyBetter',
        slug: "strictly-better",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },

  }


  options = {
    base: "https://www.strictlybetter.eu",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      functional_reprint: {
      },

      obsolete: {
      },

    }
  }


  entity = {
    "functional_reprint": {
      "fields": [
        {
          "name": "functionallyIdentical",
          "short": "Whether the reprint is functionally identical",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "originalCard",
          "short": "Name of the original card",
          "type": "`$STRING`"
        },
        {
          "name": "originalSetCode",
          "short": "Set code of the original card",
          "type": "`$STRING`"
        },
        {
          "name": "reprintCard",
          "short": "Name of the reprint card",
          "type": "`$STRING`"
        },
        {
          "name": "reprintSetCode",
          "short": "Set code of the reprint",
          "type": "`$STRING`"
        }
      ],
      "name": "functional_reprint",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "card_name",
                    "orig": "card_name",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 100,
                    "kind": "query",
                    "name": "limit",
                    "orig": "limit",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "offset",
                    "orig": "offset",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/api/functional_reprints",
              "parts": [
                "api",
                "functional_reprints"
              ],
              "select": {
                "exist": [
                  "card_name",
                  "limit",
                  "offset"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "obsolete": {
      "fields": [
        {
          "name": "id",
          "short": "Unique identifier for the card",
          "type": "`$STRING`"
        },
        {
          "name": "manaCost",
          "short": "Mana cost of the card",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "Name of the card",
          "type": "`$STRING`"
        },
        {
          "name": "obsolete",
          "short": "Whether the card is considered obsolete",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "power",
          "short": "Power value for creatures",
          "type": "`$STRING`"
        },
        {
          "name": "rarity",
          "short": "Card rarity",
          "type": "`$STRING`"
        },
        {
          "name": "setCode",
          "short": "Set code where the card appears",
          "type": "`$STRING`"
        },
        {
          "name": "text",
          "short": "Card text and abilities",
          "type": "`$STRING`"
        },
        {
          "name": "toughness",
          "short": "Toughness value for creatures",
          "type": "`$STRING`"
        },
        {
          "name": "type",
          "short": "Card type",
          "type": "`$STRING`"
        }
      ],
      "name": "obsolete",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "example": 100,
                    "kind": "query",
                    "name": "limit",
                    "orig": "limit",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "offset",
                    "orig": "offset",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "search",
                    "orig": "search",
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/api/obsoletes",
              "parts": [
                "api",
                "obsoletes"
              ],
              "select": {
                "exist": [
                  "limit",
                  "offset",
                  "search"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

