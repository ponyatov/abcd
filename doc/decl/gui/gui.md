# gui
## `decl` language extension for writing embedded GUI apps

limitations:
- embedded in hardware:
	- tiny LCD low-res and small size screens
		- 2.8" 320x240
		- 1.47" 320x172 [[ST7789]] [[ESP32-C6-LCD]]-1.47
	- fixed-size fonts
- HTML target: embedded emulation
- Android: embedded emulation

```decl
// any GUI element
class GUI {}
```

![[decl/gui/form]]
![[decl/gui/label]]
![[decl/gui/text]]
![[decl/gui/theme]]
![[decl/gui/layout]]
![[decl/gui/mvc|mvc]]
