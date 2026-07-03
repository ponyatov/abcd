# files
## project file structure

```files
bin/        // executable binaries & firmware images
doc/        //
    html/   // doxygen-generated reference manual
decl/
    **/*.md // treat .md file extension as Markdown+Decl (literal programming)
etc/        // custom app configs
    app.ini
lib/        // scripts library (if custom script language used in app)
    *.f
inc/
    *.hpp   // app-specific header files
src/
    *.cpp   // app-specific source code
tmp/        // temporary files (build, log,..)
ref/        // clone other's projects as reference from hithub here
```
```files
.clang-format   // C++ code autoformatting
.prettierrc     // JSON/JS  autoformatting
```
```files
apt.Debian      // default work system: Debian GNU/Linux 12+
apt.Ubuntu      // for build & use on servers & VMs
apt.Raspbian    // Raspberry Pi deploy
apt.Msys        // MSYS2 dependencies (Windows/MinGW)
```

## `decl` metalanguage specification

```
decl/           // metalanguage specification (modular structure)
    decl/*.md   // common `decl` spec
    cpp/        // `decl` module: C++ target (code generation)
    js/         // JavaScript target
    mcu/        // generic MCU-specific
    ...
```

see [[decl/module.md]]

- decl/ directory shared beetween projects via symlink:
```
ln -fs ~/decl/decl ~/project1/decl
ln -fs ~/decl/decl ~/project2/decl
...
```

- `decl/*.md` contains common spec
- `excl/ext/` extensions adds some optional features for some project
  - mk/ai.mk file should be tuned to add only needed/used `decl` extensions to minimize AI context
