# linux
## embedded Linux

```decl
os linux { hw=[x86,rpi] }     // embedded/backend
```

all cross dirs for items that able to run minimal Linux must contain files:
```files
X/
    X.linux     // Linux kernel config string specific for X item
    X.uclibc    // uClibc config strings
```

## default config

```files
etc/
    all.linux        // linux kernel sub-config for any target
    all.uclbc        // uClibc sub-config for any target
    ${APP}.linux     // \ application-specific linux subconfig
    ${APP}.uclibc    // / (some optional features can be disabled for smaller kernel and faster rebuild)
```

## main

- `os/linux/inc/linux.hpp`
```cpp
#pragma once

extern int main(int argc, char *argv[]);  ///< program entry point
extern void arg(int argc, char *argv  );  ///< print command line argument
```

- `os/linux/src/linux.cpp`

```cpp
#include "linux.hpp"

int main(int argc, char *argv[]) {
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
    return 0;
}

void arg(int argc, char *argv) {  //
    fprintf(stderr, "%i:%s\n", argc, argv);
}
```
