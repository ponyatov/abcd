# elvis operator forms

## branch

The ternary Elvis operator `?:` is a concise binary operator that provides a default value when the first expression evaluates to a "falsy" value (like null, false, or empty). Its name comes from the visual resemblance of ?: to Elvis Presley's iconic hairstyle.

```decl
let result = a:bool|nullable|undefined|empty ? b : c
```

equivalent: `if (a) result = b else result = c`

## assignment

```decl
let result = object.value ?= object.init
```
equivalent:
```decl
let result = object.value
	? object.value               // exists
	: object.init, object.value  // autoinit + retry
```

## default

```decl
let port = config.IP_PORT ?: 8080 // safe default
```

## exception

```decl
let config = sql.query 'select first from config' ?? log 'db error'
```
- also error can be recovered by returning some:
```decl
let config = sql.query 'select first from config' ?? log 'db error', {value=42}
```
- combination init+exception:
```decl
let channel = _dbChannels[channel.Name] 
    ?= CreateChannel(channel.Config)    // autoinit
    ?? fail 'Channel creation failed'   // exception handling
```
