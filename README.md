#  [![Build Status](https://secure.travis-ci.org/kristianmandrup/hybrid-auth.png?branch=master)](http://travis-ci.org/kristianmandrup/hybrid-auth)

[![Greenkeeper badge](https://badges.greenkeeper.io/kristianmandrup/hybrid-auth.svg)](https://greenkeeper.io/)

> Hybrid Auth

## Getting Started

Install the module with `npm install hybrid-auth --save`

## Status

WIP

## Usage

Please read the blog post [AppGyver initial page login](http://infomatrix-blog.herokuapp.com/post/appgyver-initial-page-login)
which was the inspiration for this library. It contains an outline of the general idea and gist.
The code here however is a further refactoring... WIP

## Examples

*Facebook login*

```js
var hybrid = require('hybrid-auth');

var permissions = ['email', 'user_likes'];

var app  = app || {auth: {} };

// using browser auth strategy by default
app.auth.tokenHandler = new hybrid.tokenHandler('firebase', 'facebook')

if (!window.cordova) {
  // version is optional. It refers to the version of API you may want to use.
  if (facebookConnectPlugin !== undefined) {
    facebookConnectPlugin.browserInit(appId, version);

    // will shift to using native app auth strategy
    app.auth.facebookConnector  = hybrid.connector('facebook', facebookConnectPlugin, tokenHandler, {permission: permissions})
  }
}

function doAuth(authObj) {
  // perform login...
});

hybrid.authHandler 'firebase', 'my-firebase', doAuth
```

We are also experimenting with Promise based strategies in `lib/connect/promise`

```js
app.auth.facebookConnector  = new hybrid.connect.promise.provider('facebook').then (token) ->
  // ...
```

_More example will follow shortly..._

### Alternatives

Some other ways...

- [ng-cordova-oauth](https://github.com/nraboy/ng-cordova-oauth) for use in any Angular project
- [hybrid ionic app](https://github.com/malikov/Authenticate.me-client-cordova-ionic)

Awesome!!!

### Links

- [Facebook login permissions](https://developers.facebook.com/docs/facebook-login/permissions/v2.2)
- [Promise inspiration](https://github.com/poetic/ember-cli-cordova-auth/blob/master/app)

## Contributing

In lieu of a formal style guide, take care to maintain the existing coding style.
Add unit tests for any new or changed functionality.
Lint and test your code using [Grunt](http://gruntjs.com).

```sh
# creates dist/hybrid-auth.js
$ grunt browserify
```

## License

Copyright (c) 2014 Kristian Mandrup  
Licensed under the MIT license.
