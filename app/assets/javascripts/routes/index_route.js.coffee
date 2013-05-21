KnifeWebTest.IndexRoute = Ember.Route.extend(
  redirect: ->
    this.transitionTo('servers');
)