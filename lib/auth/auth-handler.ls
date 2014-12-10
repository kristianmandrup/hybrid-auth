class AuthHandler
  ->

  # default authhandler
  authHandler: (authObj) ->
    console.log 'Authorize succes! authObj: ', authObj

  setAuthHandler: (@authHandler) ->
    @

util = require '../util'
util.xtender.extend FirebaseAuthHandler, util.Registry

module.exports = AuthHandler
