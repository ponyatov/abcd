# Metalanguage
## eBNF variant for [[grammar]] specifications

Due to intensive use of ASCII-like formats (including serialization, scripts, configs,..) we must include modular grammar specification feature in the `decl` core.

- [[decl/core/regexp|regexp]]

- types and class definitions must have optional syntax for defining serializing and deserializing rules
- any text data input must be done with validation
- [[decl/core/grammar]] definitions must be composable to build custom parsers for arbitrary formats/syntaxes by combining predefined and library-like grammar rules
- classical eBNF extended with char ranges, values checking, and optional code actions syntax

```decl
grammar {
	decdigit = 0..9
	hexdigit = 0..9A-Fa-f
	octdigit = 0..7
	bindigit = [01]
	cr       = '\r'      // carriage return
	lf       = '\n'      // line feed
	nl       = cr? lf    // new line
	sp       = [ \t\r\f] // space chars
}
```
