KnifeWebTest.ServersController = Ember.ArrayController.extend({
  filter: null

  statuses: {
    stopped: "stopped",
    running: "running",
    stopping: "stopping",
    pending: "pending"
    all: null
  }

	setFilter: (filter) ->
	  @set('filter', filter)

  filtered: ( ->
  	if @filter
	    @get("content").filterProperty 'state', @filter
	  else
	  	@get("content")
  ).property("content.@each.state", "filter").cacheable()

  refresh: ->
  	this.set("content", KnifeWebTest.Server.find());


})
