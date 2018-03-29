module Swagger::Models
  class User
    include Swagger::Blocks

    swagger_schema :User do
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
      property :projects do
        key :type, :array
        items do
          key :'$ref', :Project
        end
      end
    end
  end
end
