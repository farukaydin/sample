module Swagger::Models
  class UserInput
    include Swagger::Blocks

    swagger_schema :UserInput do
      key :required, [:id, :name, :age]
      property :id do
        key :type, :integer
        key :format, :int64
      end
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
