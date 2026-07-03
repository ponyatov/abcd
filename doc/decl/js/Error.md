# [[decl/core/error]]
## compiled to JS

```js
/**
 * @file error.mjs
 * @brief Error classes for Decl runtime
 */

/**
 * @class Error
 * @brief Base error class for Decl runtime
 * @param {any} object - object will be dumped with error message
 * @extends global.Error
 */
export class Error extends global.Error {
    constructor(object) {
        super(object);
        this.name = this.constructor.name;
    }
}

/**
 * @class NameError
 * @brief Error thrown when identifier name format is invalid
 * @extends Error
 */
export class NameError extends Error {
    constructor(object) {
        super(`object name must be valid identifier\n${object}`);
    }
}

/**
 * @class SelectorError
 * @brief Error thrown when incoming message selector not defined in actor
 * @extends Error
 */
export class SelectorError extends Error {
    constructor(object) {
        super(`unknown message selector\n${object}`);
    }
}

export default { Error, NameError, SelectorError };
```
