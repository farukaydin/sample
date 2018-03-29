class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  has_many :projects
end
