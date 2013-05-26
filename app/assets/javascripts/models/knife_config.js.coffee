KnifeWebTest.KnifeConfig = DS.Model.extend
  awsKey: DS.attr('string')
  awsSecretKey: DS.attr('string')
  knifeRb: DS.attr('string')
  user: DS.belongsTo('KnifeWebTest.User')