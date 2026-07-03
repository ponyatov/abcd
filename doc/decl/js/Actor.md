# [[decl/core/Actor|Actor]]
## compilation to JS

- [[decl/js/Message]]
- [[decl/js/Error|Error]]

```js
/**
 * @file actor.mjs
 * @brief Actor model implementation for Decl runtime
 */

import { Object } from './object.mjs';
import { Message } from './message.mjs';
import { SelectorError } from './error.mjs';

/**
 * @class Actor
 * @brief Base class for all actors in the Decl system
 * @extends Object
 * @description Actors are concurrent entities communicating via async message passing.
 *              Each actor has a mailbox and processes messages sequentially.
 *              In decl language any Object almost equal to Actor:
 *              - sync  method  call: object.method [arguments]
 *              - async message send: object!method [arguments]
 */
export class Actor extends Object {
    constructor(name) {
        super(name);
        this.mailbox = [];
    }

    toString() {
        return `${this.name}[${this.mailbox}]`;
    }

    push(msg) {
        this.mailbox.push(msg);
        this.dispatch();
    }

    pop() {
        return this.mailbox.shift();
    }

    send(dst, selector, data) {
        dst.push(new Message(this, dst, selector, data));
    }

    /**
     * @brief Dispatch and process all messages in mailbox
     * @param {Message} msg - Message to process
     * @description
     * Actor message handlers must be defined with signature:
     *   handler(msg) {}
	 * 
	 * Performance rules:
	 * - keep handler() as short and fast as possible
	 * - split long work into multiple self-sends if you can
	 * - never block in handler()
	 */
    dispatch() {
        while (this.mailbox.length > 0) {
            let msg = this.pop();
            let handler = this[msg.sel];
            if (typeof handler === 'function')
                handler.call(this, msg);
            else throw new SelectorError();
        }
    }
    
    // sample handlers
    ping(msg) { this.send(msg.src, 'pong'); }
    pong(msg) { console.log(msg); }
    
}

export default { Actor };
```
