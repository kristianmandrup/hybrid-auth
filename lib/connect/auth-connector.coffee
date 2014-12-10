class AuthConnector
  constructor: (@connector, @tokenHandler, @options = {}) ->
    @tokenHandler.native = true
    # validate?
    @permissions = @options.permissions if @options.permissions

  login: ->
    # console.log 'Authenticator login'
    throw Error "Authenticator subclass must implement login"

  loginError: (error) ->
    console.log 'An error occurred logging the user in', error

util = require '../util'
util.xtender.extend AuthConnector, util.Registry

module.exports =
  AuthConnector: AuthConnector
