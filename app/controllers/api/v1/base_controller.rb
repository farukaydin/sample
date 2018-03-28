class Api::V1::BaseController < ApplicationController
  include Renderer

  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end
end
