```sh
cd ~
cargo new hello
cd ~/hello
cargo run
```

- [[Rust/Cargo.toml|Cargo.toml]]

```toml
[package]
name    = "hello"
version = "0.0.1"
edition = "2024"

[dependencies]
```

- `src/main.rs`
![[decl/rust/hello]]

- `cargo run`
- `.vscode/tasks.json`
```json
{
	"label": "cargo: run",
	"type": "shell",
	"command": "cargo",
	"args": ["run"],
	"group": {"kind": "build", "isDefault": false},
	"presentation"   : {"showReuseMessage": false, "focus": true, "reveal": "silent", "close": false}
},
```
