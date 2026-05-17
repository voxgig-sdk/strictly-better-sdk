# StrictlyBetter SDK



Available for [Golang](go/) and [Go CLI](go-cli/) and [Lua](lua/) and [PHP](php/) and [Python](py/) and [Ruby](rb/) and [TypeScript](ts/).


## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **FunctionalReprint** |  | `/api/functional_reprints` |
| **Obsolete** |  | `/api/obsoletes` |

Each entity supports the following operations where available: **load**, **list**, **create**,
**update**, and **remove**.


## Architecture

### Entity-operation model

Every SDK call follows the same pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

At each stage a feature hook fires (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), allowing features to inspect or modify the pipeline.

### Features

Features are hook-based middleware that extend SDK behaviour.

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

You can add custom features by passing them in the `extend` option at
construction time.

### Direct and Prepare

For endpoints not covered by the entity model, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`, `headers`,
and `body`.


## Quick start

### Golang

```go
import sdk "github.com/voxgig-sdk/strictly-better-sdk/go"

client := sdk.NewStrictlyBetterSDK(map[string]any{
    "apikey": os.Getenv("STRICTLY-BETTER_APIKEY"),
})

// List all functionalreprints
functionalreprints, err := client.FunctionalReprint(nil).List(nil, nil)
```

### Lua

```lua
local sdk = require("strictly-better_sdk")

local client = sdk.new({
  apikey = os.getenv("STRICTLY-BETTER_APIKEY"),
})

-- List all functionalreprints
local functionalreprints, err = client:FunctionalReprint(nil):list(nil, nil)
```

### PHP

```php
<?php
require_once 'strictlybetter_sdk.php';

$client = new StrictlyBetterSDK([
    "apikey" => getenv("STRICTLY-BETTER_APIKEY"),
]);

// List all functionalreprints
[$functionalreprints, $err] = $client->FunctionalReprint(null)->list(null, null);
```

### Python

```python
import os
from strictlybetter_sdk import StrictlyBetterSDK

client = StrictlyBetterSDK({
    "apikey": os.environ.get("STRICTLY-BETTER_APIKEY"),
})

# List all functionalreprints
functionalreprints, err = client.FunctionalReprint(None).list(None, None)
```

### Ruby

```ruby
require_relative "StrictlyBetter_sdk"

client = StrictlyBetterSDK.new({
  "apikey" => ENV["STRICTLY-BETTER_APIKEY"],
})

# List all functionalreprints
functionalreprints, err = client.FunctionalReprint(nil).list(nil, nil)
```

### TypeScript

```ts
import { StrictlyBetterSDK } from 'strictly-better'

const client = new StrictlyBetterSDK({
  apikey: process.env.STRICTLY-BETTER_APIKEY,
})

// List all functionalreprints
const functionalreprints = await client.FunctionalReprint().list()
```


## Testing

Both SDKs provide a test mode that replaces the HTTP transport with an
in-memory mock, so tests run without a network connection.

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.FunctionalReprint(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:FunctionalReprint(nil):load(
  { id = "test01" }, nil
)
```

### PHP

```php
$client = StrictlyBetterSDK::test(null, null);
[$result, $err] = $client->FunctionalReprint(null)->load(
    ["id" => "test01"], null
);
```

### Python

```python
client = StrictlyBetterSDK.test(None, None)
result, err = client.FunctionalReprint(None).load(
    {"id": "test01"}, None
)
```

### Ruby

```ruby
client = StrictlyBetterSDK.test(nil, nil)
result, err = client.FunctionalReprint(nil).load(
  { "id" => "test01" }, nil
)
```

### TypeScript

```ts
const client = StrictlyBetterSDK.test()
const result = await client.FunctionalReprint().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```


## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
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

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
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

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```


## Language-specific documentation

- [Golang SDK](go/README.md)
- [Go CLI SDK](go-cli/README.md)
- [Lua SDK](lua/README.md)
- [PHP SDK](php/README.md)
- [Python SDK](py/README.md)
- [Ruby SDK](rb/README.md)
- [TypeScript SDK](ts/README.md)

