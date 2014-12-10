AuthConnector = require './auth-connector'

class FaceBookAuthConnector extends AuthConnector
  getPermissions: ->
    @permissions or ['public_info']

  setPermissions: (@permissions) ->

  login: ->
    @connector.login @getPermissions!, @loginSuccess, @loginError

  loginSuccess: (status) ->
    @connector.getAccessToken @tokenHandler.tokenReceived, @tokenHandler.tokenError

AuthConnector.register 'facebook', FaceBookAuthConnector

module.exports = FaceBookAuthConnector