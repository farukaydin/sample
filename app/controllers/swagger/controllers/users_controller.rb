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

    swagger_path '/users' do
      operation :get do
        key :summary, 'All Users'
        key :description, 'Returns all users from the system'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'user'
        ]
        response 200 do
          key :description, 'users response'
          schema do
            key :type, :array
            items do
              key :'$ref', :User
            end
          end
        end
      end

      operation :post do
        key :description, 'Creates a new user in the system'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'user'
        ]
        parameter do
          key :name, :user
          key :in, :body
          key :description, 'User to add to the system'
          key :required, true
          schema do
            key :'$ref', :User
          end
        end
        response 201 do
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

    swagger_path '/users/{id}' do
      operation :put do
        key :description, 'Updates the user'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'user'
        ]
        parameter do
          key :name, :user
          key :in, :body
          key :description, 'User to add to the system'
          key :required, true
          schema do
            key :'$ref', :User
          end
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
