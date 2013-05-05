class KnifeConfigSerializer < ActiveModel::Serializer
  attributes :id, :aws_key, :aws_secret_key, :knife_rb
end
