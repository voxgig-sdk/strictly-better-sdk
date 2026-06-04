# StrictlyBetter SDK

Find functional reprints and strictly-better alternatives for Magic: The Gathering cards

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Strictly Better API

[Strictly Better](https://www.strictlybetter.eu) is a community-driven Magic: The Gathering site that catalogues card upgrades — pairs of cards where one is functionally identical to or strictly stronger than another. The site lets players browse suggestions by tribe and format, vote on disputed entries, and submit new proposals; the JSON API exposes the underlying upgrade data so other tools and deck builders can consume it.

What you get from the API:

- A list of functional reprints (cards that play identically to an earlier printing).
- Obsolete-card lookups by card name, including partial-name matches, returning cards that have a strictly better counterpart.

The service is hosted at `https://www.strictlybetter.eu` and responses are JSON. CORS is enabled, so the endpoints can be called directly from browser code. No authentication is documented.

## Try it

**TypeScript**
```bash
npm install strictly-better
```

**Python**
```bash
pip install strictly-better-sdk
```

**PHP**
```bash
composer require voxgig/strictly-better-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/strictly-better-sdk/go
```

**Ruby**
```bash
gem install strictly-better-sdk
```

**Lua**
```bash
luarocks install strictly-better-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { StrictlyBetterSDK } from 'strictly-better'

const client = new StrictlyBetterSDK({})

// List all functionalreprints
const functionalreprints = await client.FunctionalReprint().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o strictly-better-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "strictly-better": {
      "command": "/abs/path/to/strictly-better-mcp"
    }
  }
}
```

## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **FunctionalReprint** | Pairs of Magic: The Gathering cards that are functionally identical reprints of one another, served from `GET /api/functional_reprints`. | `/api/functional_reprints` |
| **Obsolete** | Cards that have a strictly better counterpart, looked up by (partial) card name via `GET /api/obsoletes/{CardName}`. | `/api/obsoletes` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from strictlybetter_sdk import StrictlyBetterSDK

client = StrictlyBetterSDK({})

# List all functionalreprints
functionalreprints, err = client.FunctionalReprint(None).list(None, None)
```

### PHP

```php
<?php
require_once 'strictlybetter_sdk.php';

$client = new StrictlyBetterSDK([]);

// List all functionalreprints
[$functionalreprints, $err] = $client->FunctionalReprint(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/strictly-better-sdk/go"

client := sdk.NewStrictlyBetterSDK(map[string]any{})

// List all functionalreprints
functionalreprints, err := client.FunctionalReprint(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "StrictlyBetter_sdk"

client = StrictlyBetterSDK.new({})

# List all functionalreprints
functionalreprints, err = client.FunctionalReprint(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("strictly-better_sdk")

local client = sdk.new({})

-- List all functionalreprints
local functionalreprints, err = client:FunctionalReprint(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = StrictlyBetterSDK.test()
const result = await client.FunctionalReprint().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = StrictlyBetterSDK.test(None, None)
result, err = client.FunctionalReprint(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = StrictlyBetterSDK::test(null, null);
[$result, $err] = $client->FunctionalReprint(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.FunctionalReprint(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = StrictlyBetterSDK.test(nil, nil)
result, err = client.FunctionalReprint(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:FunctionalReprint(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Strictly Better API

- Upstream: [https://www.strictlybetter.eu](https://www.strictlybetter.eu)
- API docs: [https://freepublicapis.com/strictly-better-api](https://freepublicapis.com/strictly-better-api)

---

Generated from the Strictly Better API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
