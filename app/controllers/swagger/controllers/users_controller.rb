module Swagger::Controllers
  class UsersController
    include Swagger::Blocks

    swagger_path '/users/{id}' do
      operation :get do
        key :summary, 'Find User by ID'
        key :description, 'Returns a single user'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'user'
        ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of user to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :User
          end
        end
        response 422 do
          key :description, 'Unprocessable Entity'
          schema do
            key :'$ref', :Error
          end
        end
      end
    end

  end
end
