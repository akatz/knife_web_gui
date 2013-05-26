window.KnifeWebTest.Auth = Em.Auth.create
  signInEndPoint: '/users/sign_in'
  signOutEndPoint: '/users/sign_out'

  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  sessionAdapter: 'cookie'

  userModel: 'KnifeWebTest.User'

  modules: ['emberData', 'rememberable']

  rememberable:
    tokenKey: 'remember_token'
    period: 7
    autoRecall: true