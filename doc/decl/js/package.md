# package.json
## project/module specification

- `~/some/project.json`

this is string interpolation template, must be evaluated on `package.json` generation using current app settings:

```json
{
    "name"       : "{app}",
    "version"    : "{version?:0.0.1}",
    "description": "{title}",
    "author"     : "{author} <{email}>",
    "license"    : "{app.license?:MIT}",
    "main"       : "js/{app}.js",
    "keywords"   : [],
    "repository" : {
        "type": "git",
        "url": "https://github.com/{user}/{app}.git"
    },
    "engines": {
        "node": ">=22.22.0"
    },
    "scripts": {
        "start"     : "node js/ventest.mjs",
        "dev"       : "nodemon js/ventest.mjs",
        "test"      : "vitest",
        "test:watch": "vitest --watch"
    },
    "devDependencies": {
        "nodemon": "^3.1.14",
        "vitest" : "^4.1.9"
    },
    "dependencies": {
        "modbus-serial": "^8.0.25",
        "mqtt"         : "^5.15.1",
        "mysql"        : "^2.18.1",
        "redis"        : "^6.0.0",
        "node-red"                : "^5.0.0",
        "node-red-contrib-{app}": "file:nodered",
    }
}
```
