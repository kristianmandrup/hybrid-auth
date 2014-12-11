AuthConnector = require './auth-connector'

class GoogleAuthConnector extends AuthConnector
  getSettings: ->
    @settings or {}

  setSettings: (@settings) ->

  login: ->
    @connector.login @getSettings!, @loginSuccess, @loginError

  loginSuccess: (token) ->
    console.log 'login received token: ', token
    token

AuthConnector.register 'google', GoogleAuthConnector

module.exports = GoogleAuthConnector