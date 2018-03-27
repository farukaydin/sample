class Api::V1::UsersController < Api::V1::BaseController
  before_action :assign_user, only: [:show, :update, :destroy]

  def index
    @users = User.all

    render json: UserSerializer.new(@users).serialized_json
  end

  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  def create
    @user = User.new(user_params)

    if @user.save
      return head :created
    end

    render json: { errors: @user.errors }.to_json
  end

  def update
    if @user.update(user_params)
      return render json: UserSerializer.new(@user).serialized_json
    end

    render json: { errors: @user.errors }.to_json
  end

  def destroy
    if @user.destroy
      return head :no_content
    end

    render json: { errors: @user.errors }.to_json
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end

  def assign_user
    @user = User.find(params[:id])
  end
end
