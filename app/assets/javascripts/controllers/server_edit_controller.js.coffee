KnifeWebTest.ServerEditController = Em.ObjectController.extend(
  needs: ['server']

  startEditing: ->
    server = @get('content')
    transaction = server.get('store').transaction()
    transaction.add(server)
    @transaction = transaction

  stopEditing: ->
    transaction = @transaction
    if transaction
      transaction.rollback()
      @transaction = undefined

  save: ->
    @transaction.commit()
    @transaction = undefined
    @get('controllers.server').stopEditing()

  cancel: ->
    @get('controllers.server').stopEditing()
)
