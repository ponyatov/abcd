# object
## translation to JS

- [[decl/js/Error]]
```js
/**
 * @file object.mjs
 * @brief Root Object class implementation for Decl runtime
 */

import { NameError } from './error.mjs';

/**
 * @class Object
 * @brief Root class for all objects in Decl system
 * @description Provides basic functionality including naming,
 *              optional serialization, debugging, and metrics collection.
 *              Can be extended for platform-specific features.
 */
export class Object {
    /**
     * @brief Create a new Object instance
     * @param {string|null} name Optional name identifier for this object
     */
    constructor(name = null) {
        /**
         * @name name
         * @memberof Object
         * @type {string|null}
         * @description Optional object name. Can be null for anonymous objects.
         *              Limited with r'[_a-zA-Z][_a-zA-Z0-9]*'
         *              - must be valid identifier in any target language
         *              - no local language chars, unprintables, operators etc
         */
        if (name !== null && !/^[_a-zA-Z][_a-zA-Z0-9]*$/.test(name)) {
            throw new NameError();
        }
        this.name = name;
    }

    dump = []; // object keys list to dump

    toString() {
        const fields = {};
        for (const key of this.dump) fields[key] = `${this[key]}`;
        return `${this.constructor.name}:${this.name} ${JSON.stringify(fields)}`;
    }
}

export default Object;
```
