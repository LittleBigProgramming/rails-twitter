class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end

  def show
    @user =
      User.where(
        User.arel_table[:username]
          .lower
          .matches("%#{params[:id].downcase}%")
      ).first

    @timeline = Timeline.new([@user])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end