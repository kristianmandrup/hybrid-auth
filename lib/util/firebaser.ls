buildRef = (ref) ->
  fireRef = new Firebase "https://#{ref}.firebaseio.com"
  typeof ref is 'string' ? fireRef : ref

Firebaser =
  setFirebaseRef: (ref) ->
    @firebaseRef = buildRef ref

module.exports = Firebaser