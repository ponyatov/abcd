# decl

> defines `decl` syntax & semantics in `decl` itself

```decl
// root superclass
class Object:
    init(name:str)      // any object can have name
```

```decl
// hardware item or component
class HW
// hardware subsystem
class HWSection: HW

// software component
class Software:
    #kw = 'sw'
    apt:option<string> // list of Debian packages splitted with spaces
// prococol
class Protocol
```
