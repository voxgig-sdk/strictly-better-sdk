# StrictlyBetter SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "StrictlyBetter",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://www.strictlybetter.eu",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "functional_reprint": {},
                "obsolete": {},
            },
        },
        "entity": {
      "functional_reprint": {
        "fields": [
          {
            "name": "functionallyIdentical",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "originalCard",
            "type": "`$STRING`",
          },
          {
            "name": "originalSetCode",
            "type": "`$STRING`",
          },
          {
            "name": "reprintCard",
            "type": "`$STRING`",
          },
          {
            "name": "reprintSetCode",
            "type": "`$STRING`",
          },
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
                      "type": "`$STRING`",
                    },
                    {
                      "example": 100,
                      "kind": "query",
                      "name": "limit",
                      "orig": "limit",
                      "type": "`$INTEGER`",
                    },
                    {
                      "example": 0,
                      "kind": "query",
                      "name": "offset",
                      "orig": "offset",
                      "type": "`$INTEGER`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/functional_reprints",
                "parts": [
                  "api",
                  "functional_reprints",
                ],
                "select": {
                  "exist": [
                    "card_name",
                    "limit",
                    "offset",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "obsolete": {
        "fields": [
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "manaCost",
            "type": "`$STRING`",
          },
          {
            "name": "name",
            "type": "`$STRING`",
          },
          {
            "name": "obsolete",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "power",
            "type": "`$STRING`",
          },
          {
            "name": "rarity",
            "type": "`$STRING`",
          },
          {
            "name": "setCode",
            "type": "`$STRING`",
          },
          {
            "name": "text",
            "type": "`$STRING`",
          },
          {
            "name": "toughness",
            "type": "`$STRING`",
          },
          {
            "name": "type",
            "type": "`$STRING`",
          },
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
                      "type": "`$INTEGER`",
                    },
                    {
                      "example": 0,
                      "kind": "query",
                      "name": "offset",
                      "orig": "offset",
                      "type": "`$INTEGER`",
                    },
                    {
                      "kind": "query",
                      "name": "search",
                      "orig": "search",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/obsoletes",
                "parts": [
                  "api",
                  "obsoletes",
                ],
                "select": {
                  "exist": [
                    "limit",
                    "offset",
                    "search",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
