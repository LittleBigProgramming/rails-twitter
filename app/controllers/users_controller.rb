class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end