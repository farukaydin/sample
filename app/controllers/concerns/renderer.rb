module Renderer
  extend ActiveSupport::Concern

  def render_object(resource, status: :ok)
    serializer = resource.respond_to?(:each) ? resource.first.class : resource.class
    serializer_name = (serializer.to_s + "Serializer").constantize

    render json: serializer_name.new(resource).serialized_json, status: status
  end

  def render_errors(resource, status: :unprocessable_entity)
    render json: ErrorSerializer.new(resource.errors).serialized_json, status: status
  end
end
