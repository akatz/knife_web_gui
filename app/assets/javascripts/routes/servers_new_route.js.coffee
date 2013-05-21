KnifeWebTest.ServersNewRoute = Ember.Route.extend(
  model: ->
    return null

  setupController: (controller) ->
    controller.startEditing();

  deactivate: ->
    @controllerFor('contacts.new').stopEditing();

)