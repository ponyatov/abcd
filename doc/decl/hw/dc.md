# DC
## DC power supply model (simulator)

```decl
type uiv = uf16.1       // small positive float with .n precision
type siv =  f16.1       // small signed   float with .n precision

actor DC {
	voltage:uiv         // nominal output voltage
	current:uiv         // max output current
	ac:bool             // AC powered
	acv:uiv<110..280>   // mains input voltage
	dcv:uiv<0..current> // current output voltage
	batv:uiv            // lead acid battery voltage
	bati:siv            // buttery current ()
	dI:siv              // current increment
	dV:siv              // voltage increment
	
	simulate {
		// slowly increases/decreases V/I with random AC faults
		// send current I/V to `power` topic
		// every 10 seconds ramdomly change dI/dV (value and direction)
	}
}
```
```js
class DC extends Actor {
}
```