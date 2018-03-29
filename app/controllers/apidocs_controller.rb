class ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Swagger'
      key :description, 'A sample API that uses a userstore as an example to ' \
                        'demonstrate features in the swagger-2.0 specification'
      contact do
        key :name, 'Askcharlie Core Team'
      end
      license do
        key :name, 'MIT'
      end
    end
    key :host, 'localhost:3000'
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
    key :schemes,  ["http"]
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Swagger::Models::User,
    Swagger::Models::Project,
    Swagger::Models::Error,
    Swagger::Controllers::UsersController,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
