class UsersController < ApplicationController
  def index
    render json: { "Hello" => "world!" }.to_json
  end
end
