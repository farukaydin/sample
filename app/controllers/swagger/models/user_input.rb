module Swagger::Models
  class UserInput
    include Swagger::Blocks

    swagger_schema :UserInput do
      key :required, [:name, :age]
      property :name do
        key :type, :string
      end
      property :age do
        key :type, :integer
        key :format, :int32
      end
    end
  end
end
