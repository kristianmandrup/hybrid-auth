'use strict';

var hybrid = require('../lib/hybrid-auth.js');

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
