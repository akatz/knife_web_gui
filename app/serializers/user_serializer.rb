class UserSerializer  < ActiveModel::Serializer
  attributes :id, :email, :param

  def param
    namePortion = email.split('@').first
    "#{id}-#{namePortion.dasherize.parameterize}"
  end
end