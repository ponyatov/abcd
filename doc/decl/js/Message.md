# [[decl/core/Message|Message]]
## compiled to JS

```js
/**
 * @file message.mjs
 * @brief Actor message implementation for Decl runtime
 */

import { Object } from './object.mjs';
import { NameError } from './error.mjs';

/**
 * @class Message
 * @brief Represents a message sent between actors
 * @extends Object
 */
export class Message extends Object {
    /// static counter for unique message IDs
    static #id = 0;

    /**
     * @brief Create a new Message instance
     * @param {Actor} src - Sender actor
     * @param {Actor|Group} dst - Receiver actor or group
     * @param {string} sel - Message selector (actor/object method name)
     * @param {any} data - Method parameters (optional)
     */
    constructor(src, dst, sel, data = null) {
        super(null); // messages don't have names
        this.src = src;
        this.dst = dst;
        this.id = Message.#id++;
        this.ts = Date.now();
        if (sel !== null && !/^[_a-zA-Z][_a-zA-Z0-9]*$/.test(sel)) {
            throw new NameError();
        }
        this.sel = sel;
        this.data = data;
    }

    toString() {
        return `{src:${this.src} dst:${this.dst} id:${this.id} sel:${this.sel} ${this.data ? this.data : ''}}`;
    }
}

export default { Message };
```
