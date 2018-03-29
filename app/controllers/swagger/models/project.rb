module Swagger::Models
  class Project
    include Swagger::Blocks

    swagger_schema :Project do
      key :required, [:id, :name]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
    end
  end
end
