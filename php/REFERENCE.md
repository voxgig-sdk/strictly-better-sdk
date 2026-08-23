# StrictlyBetter PHP SDK Reference

Complete API reference for the StrictlyBetter PHP SDK.


## StrictlyBetterSDK

### Constructor

```php
require_once __DIR__ . '/strictlybetter_sdk.php';

$client = new StrictlyBetterSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `StrictlyBetterSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = StrictlyBetterSDK::test();
```


### Instance Methods

#### `FunctionalReprint($data = null)`

Create a new `FunctionalReprintEntity` instance. Pass `null` for no initial data.

#### `Obsolete($data = null)`

Create a new `ObsoleteEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): StrictlyBetterUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## FunctionalReprintEntity

```php
$functional_reprint = $client->FunctionalReprint();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `functionallyIdentical` | `bool` | No | Whether the reprint is functionally identical |
| `originalCard` | `string` | No | Name of the original card |
| `originalSetCode` | `string` | No | Set code of the original card |
| `reprintCard` | `string` | No | Name of the reprint card |
| `reprintSetCode` | `string` | No | Set code of the reprint |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->FunctionalReprint()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): FunctionalReprintEntity`

Create a new `FunctionalReprintEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ObsoleteEntity

```php
$obsolete = $client->Obsolete();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No | Unique identifier for the card |
| `manaCost` | `string` | No | Mana cost of the card |
| `name` | `string` | No | Name of the card |
| `obsolete` | `bool` | No | Whether the card is considered obsolete |
| `power` | `string` | No | Power value for creatures |
| `rarity` | `string` | No | Card rarity |
| `setCode` | `string` | No | Set code where the card appears |
| `text` | `string` | No | Card text and abilities |
| `toughness` | `string` | No | Toughness value for creatures |
| `type` | `string` | No | Card type |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Obsolete()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ObsoleteEntity`

Create a new `ObsoleteEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new StrictlyBetterSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

