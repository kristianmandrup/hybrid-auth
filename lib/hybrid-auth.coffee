'use strict'

api =
  auth:       require './auth'
  connect:    require './connect'
  token:      require './token'
  util:       require './util'

tokenHandler = (handler, provider) ->
  Handler = api.token.Handler.lookup(handler)
  new Handler provider

authHandler = (handler, ...args) ->
  Handler = api.auth.Handler.lookup(handler)
  new Handler args

connector = (provider, ...args) ->
  Connector = api.connect.Connector.lookup(provider)
  new Connector args


module.exports =
  api:          api
  tokenHandler: tokenHandler
  authHandler:  authHandler
  connector:    connector
