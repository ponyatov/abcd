# [[decl/gui/counter|counter]]
## compiles to HTML/JS

```html
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no"
        />
        <title>Counter</title>
    </head>

    <style>
        body {
            background: #222;
            color: lightgreen;
            font-family: monospace;
        }

        #display {
            background: #142;
            color: yellow;
            text-align: right;
            font-size: 5mm;
        }

    </style>

    <body>
        <div id="counter">
            counter
            <div id="display">display</div>
            </div>
        </div>
    </body>

    <script/>
</html>
```

```js
        class Actor {
            constructor(name) {
                this.name = name || this.constructor.name;
                this.mailbox = []; // message queue
            }

            // string representation for logging
            toString() {
                return `${this.name}[${this.mailbox.length}]`;
            }

            // send async message (push + schedule dispatch)
            send(msg) {
                console.log(`${this}.send ${msg}`);
                this.mailbox.push(msg);
                // microtask dispatch (non-blocking actor running)
                Promise.resolve().then(() => this.dispatch());
            }

            // process messages if any
            dispatch() {
                while (this.mailbox.length > 0)
                    this.process(this.mailbox.shift());
            }

            // process single message: override in subclass
            process(msg) {
                console.log(`${this}.process ${msg}`);
            }
        }

        class CounterModel extends Actor {
            constructor() {
                super();
                this.seconds = 0;
            }

            // any message starts timer
            process(msg) {
                console.log(`${this}.process ${msg}`);
                this.timer_1s = setInterval(() => {
                    this.seconds++;
                    this.view.send('update');
                }, 1000);
            }
        }

        class CounterView extends Actor {
            constructor(model) {
                super();
                this.model = model;
                model.view = this;
                this.display = document.getElementById('display');
            }

            // any message runs update
            process(msg) {
                this.display.innerText = `${this.model.seconds}`;
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            const model = new CounterModel();
            const view = new CounterView(model);
            model.send('start');
        });
```
