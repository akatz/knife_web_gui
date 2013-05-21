KnifeWebTest.ServersNewController = Ember.ObjectController.extend(
  startEditing: ->
    @transaction = @get('store').transaction();
    @set('content', @transaction.createRecord(KnifeWebTest.Server, {}));

  stopEditing: ->
    if @transaction
      @transaction.rollback();
      @transaction = null;

	save: (server) ->
	  @transaction.commit();
	  @transaction = null;
)
