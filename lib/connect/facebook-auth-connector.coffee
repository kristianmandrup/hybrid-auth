Authenticator = require 'authenticator'

class FaceBookAuthenticator extends Authenticator
  getPermissions: ->
    @permissions or ['public_info']

  setPermissions: (@permissions) ->

  login: ->
    @connector.login @getPermissions(), @loginSuccess, @loginError

  loginSuccess: (status) ->
    @connector.getAccessToken @tokenHandler.tokenReceived, @tokenHandler.tokenError

Authenticator.register 'facebook', FaceBookAuthenticator

module.exports = FaceBookAuthenticator