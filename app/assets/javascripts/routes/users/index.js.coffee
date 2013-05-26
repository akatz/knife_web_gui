KnifeWebTest.UsersIndexRoute = Em.Route.extend
  model: ->
    if KnifeWebTest.Auth.get('signedIn')
      KnifeWebTest.User.find()