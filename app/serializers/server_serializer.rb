class ServerSerializer < ActiveModel::Serializer
  attributes :id, :instance_id, :name, :public_ip, :private_ip, :flavor, :image, :ssh_key_name, :security_groups, :state
end
