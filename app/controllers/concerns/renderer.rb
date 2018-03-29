module Renderer
  extend ActiveSupport::Concern
  include ActiveModel::Serialization

  def render_object(resource, status: :ok)
    render json: resource, status: status
  end

  def render_errors(resource, status: :unprocessable_entity)
    render json: ErrorSerializer.new(resource.errors).serialized_json, status: status
  end
end
