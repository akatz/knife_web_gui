KnifeWebTest.KnifeConfigRoute = Ember.Route.extend(
  setupController: (controller)->
    controller.set('content', KnifeWebTest.Auth.get('user').knife_config )
)