KnifeWebTest.ApplicationController = Em.ObjectController.extend(
  currentUser: (->
    this.get('content')
  ).property('content')

)
