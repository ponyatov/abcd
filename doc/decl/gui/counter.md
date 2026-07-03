# counter
## demo code with visual timer model

target: single page HTML with embedded JS

[[decl/core/Message|Message]]

```decl
model Counter {
	seconds:uint = 0              // internal state: counter

	start { t1s.start   }         // on `start` message: run timer
	reset { seconds = 0 }

	t1s = timer 1s {
		seconds++                 // change internal state with timer
		self.view!update seconds  // notify view
	} 
}

form Counter  {
	init model {
		self.model = model
		model.view = self
		model.seconds.set = this.update   // subscribe to model update
	}
	
	update value { self.display = value }
}
```

- [[decl/js/counter]]
