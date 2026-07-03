# cortex
## Cortex-M microcontrollers

```decl
arch cm {}
arch cm4: cm {}
arch cm3: cm {}
arch cm1: cm {}
arch cm0: cm {}
```
```decl
cpu stm32f { arch=cm }
```
```decl
hw pillf0 { cpu=stm32f030f4 }
hw pillf0 { cpu=stm32f103c8 }
hw pillf4 { cpu=stm32f4 }
hw iskra { cpu=stm32f405 }
hw disco4 { cpu=stmf407 }
```
