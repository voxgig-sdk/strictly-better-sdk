# StrictlyBetter Python SDK Reference

Complete API reference for the StrictlyBetter Python SDK.


## StrictlyBetterSDK

### Constructor

```python
from strictlybetter_sdk import StrictlyBetterSDK

client = StrictlyBetterSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `StrictlyBetterSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = StrictlyBetterSDK.test()
```


### Instance Methods

#### `FunctionalReprint(data=None)`

Create a new `FunctionalReprintEntity` instance. Pass `None` for no initial data.

#### `Obsolete(data=None)`

Create a new `ObsoleteEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## FunctionalReprintEntity

```python
functional_reprint = client.FunctionalReprint()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `functionallyIdentical` | `bool` | No | Whether the reprint is functionally identical |
| `originalCard` | `str` | No | Name of the original card |
| `originalSetCode` | `str` | No | Set code of the original card |
| `reprintCard` | `str` | No | Name of the reprint card |
| `reprintSetCode` | `str` | No | Set code of the reprint |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.FunctionalReprint().list()
for functional_reprint in results:
    print(functional_reprint)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `FunctionalReprintEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ObsoleteEntity

```python
obsolete = client.Obsolete()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `str` | No | Unique identifier for the card |
| `manaCost` | `str` | No | Mana cost of the card |
| `name` | `str` | No | Name of the card |
| `obsolete` | `bool` | No | Whether the card is considered obsolete |
| `power` | `str` | No | Power value for creatures |
| `rarity` | `str` | No | Card rarity |
| `setCode` | `str` | No | Set code where the card appears |
| `text` | `str` | No | Card text and abilities |
| `toughness` | `str` | No | Toughness value for creatures |
| `type` | `str` | No | Card type |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Obsolete().list()
for obsolete in results:
    print(obsolete)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ObsoleteEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = StrictlyBetterSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

