module.expots =
  signIn: (settings, Promise) ->
    if typeof plugins is undefined)
      msg = 'Plugins are only available on the simulator or on a real device.';
      return Promise.reject(msg);

    if typeof plugins.googleplus is undefined
      msg = 'The google plus plugin was not found: https://github.com/poetic/cordova-plugin-googleplus'
      Promise.reject msg

    new Promise (resolve, reject) ->
      plugins.googleplus.login settings, resolve, reject
