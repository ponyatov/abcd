# `decl` 0.0.1
## declarative [[lang/DSL|DSL]] source-to-source translator

(c) [[Dmitry Ponyatov]] <<dponyatov@gmail.com>> 2026 [[license/MIT|MIT]]

github: https://github.com/ponyatov/decl

```sh
git remote add gh   git@github.com:ponyatov/decl.git
git remote add flic git@gitflic.ru:dponyatov/decl.git
```

> DECL HAS NO () PARENS !!!

![[decl/toc]]

## [[project maintenance]]
## [[IDE]]: VSCode integration
## [[Obsidian]]: documenting
## [[spec]]

I want to write code for Linux (x86 and rpi3+) and firmware for Cortex-M and
ESP32C/ESP32S microcontrollers in my own high-level declarative DSL language.

Syntax and semantics: I want all the goodies and syntax features from
[[py/Python|Python]], [[Elixir]], and [[OCaml/OCaml|OCaml]]/[[Fsh|F#]]:
- actor model (threads + async messaging)
- rich pattern matching
- my targets is heterogenous clusters of multi-platform nodes, so I need cross-node messaging and rich (de)serialization
- class-based OOP

Instead of compilation, **high-level translation** from a set of `decl` files (every .md file = decl module) into human-readable embedded C++ code **using AI** must be used.

## Overview

`decl` is a high-level declarative DSL translator that converts literal
programming and specification files into human-readable embedded C++ code using
AI-assisted translation. It targets heterogeneous clusters of multi-platform
nodes including Linux (x86, RPi3+), Cortex-M microcontrollers, and ESP32C/ESP32S
devices.

## [[Literate Programming]]

- Markdown-разметка: описание логики системы в свободной форме
- decl-фрагменты: формальное описание на DSL

## Features

- Rich DSL syntax combining the best from Python, Elixir, Nim, and OCaml/F#
- Actor model with threads and async messaging
- Pattern matching for elegant code
- Class-based OOP with inheritance and polymorphism
- Cross-node messaging with automatic serialization/deserialization
- Multi-platform support from high-end Linux to resource-constrained MCUs

### Philosophy

Instead of traditional compilation, `decl` uses **literal programming** principles:

- Every `.md` file is a `decl` module (Markdown + Decl code)
- AI-assisted translation generates human-readable **Embedded C++**
- Documentation and code live together

## reference projects

reference projects used for deleveloping [[decl/decl|decl]] as a form of legacy code representation, and rework

- [[decl/horizon/horizon]]

## target platforms/languages

- [[decl/js/js]]
- [[decl/ts/ts]]
- [[decl/cpp/cpp|cpp]]
- [[decl/rust/rust]]

## [[decl/vending/vending|vending]]
