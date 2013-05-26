KnifeWebTest.UsersShowRoute = Em.Route.extend
  serialize: (model) ->
    user_id: model.get('param')

  model: (params) ->
    if KnifeWebTest.Auth.get('signedIn')
      KnifeWebTest.User.find(params.user_id)