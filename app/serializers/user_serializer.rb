class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :age
end
