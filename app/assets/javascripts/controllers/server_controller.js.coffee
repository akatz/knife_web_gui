KnifeWebTest.ServerController = Ember.ObjectController.extend(
  isEditing: false

  destroy: (server) ->
    server.on("didDelete", this, ->
      @transitionTo("servers")
    )
    server.deleteRecord()
    @get('store').commit()

  startEditing: ->
    server = @get('content')
    transaction = server.get('store').transaction()
    transaction.add(server)
    @transaction = transaction
    @set('isEditing', true)

  stopEditing: ->
    transaction = @transaction
    if transaction
      transaction.rollback()
    @transaction = undefined
    @set('isEditing', false)

  cancel: ->
    @stopEditing()

  update: ->
    @transaction.commit()
    @transaction = undefined
    @stopEditing()
)
