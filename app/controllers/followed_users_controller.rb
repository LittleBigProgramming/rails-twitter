class FollowedUsersController < ApplicationController
  def create
    user_to_follow = find_user
    current_user.followed_users << user_to_follow
    current_user.follow(user_to_follow)
    redirect_to user_to_follow
  end

  private

  def find_user
    @_user ||= User.where(
        User.arel_table[:username]
            .lower
            .matches("%#{params[:id].downcase}%")
    ).first
  end
end
