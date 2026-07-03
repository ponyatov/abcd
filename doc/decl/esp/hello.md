```decl
app hello {
	target = esp32
	hw     = esp32wroom
}
```
```
#include <cstdio>

extern "C" void app_main(void) {  //
    printf("Hello World!\n");
}
```
