# StrictlyBetter Ruby SDK Reference

Complete API reference for the StrictlyBetter Ruby SDK.


## StrictlyBetterSDK

### Constructor

```ruby
require_relative 'strictly-better_sdk'

client = StrictlyBetterSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `StrictlyBetterSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = StrictlyBetterSDK.test
```


### Instance Methods

#### `FunctionalReprint(data = nil)`

Create a new `FunctionalReprint` entity instance. Pass `nil` for no initial data.

#### `Obsolete(data = nil)`

Create a new `Obsolete` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## FunctionalReprintEntity

```ruby
functional_reprint = client.FunctionalReprint
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `functionally_identical` | ``$BOOLEAN`` | No |  |
| `original_card` | ``$STRING`` | No |  |
| `original_set_code` | ``$STRING`` | No |  |
| `reprint_card` | ``$STRING`` | No |  |
| `reprint_set_code` | ``$STRING`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.FunctionalReprint.list(nil)
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `FunctionalReprintEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ObsoleteEntity

```ruby
obsolete = client.Obsolete
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | ``$STRING`` | No |  |
| `mana_cost` | ``$STRING`` | No |  |
| `name` | ``$STRING`` | No |  |
| `obsolete` | ``$BOOLEAN`` | No |  |
| `power` | ``$STRING`` | No |  |
| `rarity` | ``$STRING`` | No |  |
| `set_code` | ``$STRING`` | No |  |
| `text` | ``$STRING`` | No |  |
| `toughness` | ``$STRING`` | No |  |
| `type` | ``$STRING`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Obsolete.list(nil)
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ObsoleteEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = StrictlyBetterSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

