TokenHandler = require 'token-handler'

class FirebaseTokenHandler extends TokenHandler
  oAuthMethod: ->
    if @native then 'authWithOAuthToken' else 'authWithOAuthPopup'

  authMethod: ->
    @firebaseRef[@oAuthMethod()]

  tokenReceived: (token) ->
    # Authenticate with Facebook using an existing OAuth 2.0 access token
    @authMethod() @authProviderName, token, @authHandler

TokenHandler.register 'firebase', FirebaseTokenHandler

util = require '../util'
util.extender.include FirebaseTokenHandler, util.Firebaser

module.exports = FirebaseTokenHandler