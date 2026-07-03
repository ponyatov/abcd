# Object
## root class for all objects

can be overriden and internally extended for extra features like generic (de)[[decl/core/Serialization|Serialization]], [[decl/core/debug|debug]], metrics collection,..

![[decl/core/name]]
```decl
class Object {
	name:?name  // optional name
}
```

![[decl/core/constructor|constructor]]
![[decl/core/destructor]]

[[decl/js/object]]
