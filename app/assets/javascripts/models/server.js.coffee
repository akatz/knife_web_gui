KnifeWebTest.Server = DS.Model.extend
  instanceId: DS.attr('string')
  name: DS.attr('string')
  publicIp: DS.attr('string')
  privateIp: DS.attr('string')
  flavor: DS.attr('string')
  image: DS.attr('string')
  sshKeyName: DS.attr('string')
  securityGroups: DS.attr('string')
  state: DS.attr('string')

  publicIpUrl: (->
    return 'ssh://' + this.get('publicIp')
  ).property('publicIp')