# ![](vscode/logo.png) `abcd` 0.0.1
## Async ByteCode Dynamic language VM

(c) [[Dmitry Ponyatov]] <<dponyatov@gmail.com>> 2026 [[license/MIT|MIT]]

github: https://github.com/ponyatov/abcd

## Overview

**abcd** is an Virtual Machine designed as the dynamic language runtime for microcontrollers, embedded/server/desktop Linux, and mobile phones. It provides a lightweight, high-performance execution environment for heterogeneous clusters of multi-platform nodes including Linux (x86, RPi3+), Cortex-M microcontrollers, and ESP32C/ESP32S devices.

## Targets

top-down priority:

- **Server/Desktop Linux** (x86_64, i386/retro)
- **Embedded Linux** (RPi3+, ARM devices, i386/PC104)
- **Microcontrollers** (Cortex-M, ESP32C, ESP32S)
- **Mobile phones** (Android)

## Features

- **ByteCode interpreter** optimized for MCU-based platforms
	- **Multi-platform** heterogenous clusters of interconnected nodes
	- **Lightweight design**: minimal binary size, 16bit code & data pointers
- **Async execution** with actor model (isolated threads + async messaging)
	- **Cross-node messaging** with automatic serialization/deserialization
- **Dynamic language** features with runtime flexibility
	- **Thread-local GC** for automatic memory management
	- **Class-based OOP** with inheritance and polymorphism
	- **Rich pattern matching** support (inspired by Elixir/OCaml)
