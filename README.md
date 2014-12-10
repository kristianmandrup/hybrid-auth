#  [![Build Status](https://secure.travis-ci.org/kristianmandrup/hybrid-auth.png?branch=master)](http://travis-ci.org/kristianmandrup/hybrid-auth)

> Hybrid Auth

## Getting Started

Install the module with: `npm install hybrid-auth`

Install with cli command

```sh
$ npm install -g hybrid-auth
$ hybrid-auth --help
$ hybrid-auth --version
```


```sh
# creates a browser.js
$ grunt browserify
```

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

var FirebaseTokenHandler  = hybrid.token.Handler.lookup('firebase')
app.auth.tokenHandler     = new FirebaseTokenHandler('facebook') // not using native auth strategy by default

if (!window.cordova) {
  // version is optional. It refers to the version of API you may want to use.
  if (facebookConnectPlugin !== undefined) {
    facebookConnectPlugin.browserInit(appId, version);

    var FacebookConnector   = hybrid.connect.Connector.lookup('facebook')
    app.auth.facebookConnector  = new FacebookConnector(facebookConnectPlugin, tokenHandler, {permission: permissions})
  }
}

var FirebaseAuthHandler   = hybrid.auth.Handler.lookup('firebase')
app.auth.authHandler  = new FirebaseAuthHandler('my-firebase', function (authObj) {
  // perform login...
});
```

As soon as we get this infrastructure is working we can improve the public API to make it a little easier to use ;)

We are also experimenting with Promise based strategies in `lib/connect/promise`

_More example will follow shortly..._

### Links

- [Facebook login permissions](https://developers.facebook.com/docs/facebook-login/permissions/v2.2)
- [Promise inspiration](https://github.com/poetic/ember-cli-cordova-auth/blob/master/app)

## Contributing

In lieu of a formal style guide, take care to maintain the existing coding style.
Add unit tests for any new or changed functionality.
Lint and test your code using [Grunt](http://gruntjs.com).

## License

Copyright (c) 2014 Kristian Mandrup  
Licensed under the MIT license.
