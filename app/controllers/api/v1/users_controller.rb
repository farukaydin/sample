class Api::V1::UsersController < Api::V1::BaseController
  before_action :assign_user, only: [:show, :update, :destroy, :projects]

  def index
    @users = User.all

    render_object(@users)
  end

  def show
    render json: UserSerializer.new(@user)
    # render_object(@user)
  end

  def create
    @user = User.new(user_params)
    return head :created if @user.save

    render_errors(@user)
  end

  def update
    return render_object(@user) if @user.update(user_params)

    render_errors(@user)
  end

  def projects
    # render_object(@user.projects)
  end

  def destroy
    return head :no_content if @user.destroy

    render_errors(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end

  def assign_user
    @user = User.find(params[:id])
  end
end
