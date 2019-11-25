class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.like(post)
    redirect_to root_path
  end

  def destroy
    current_user.unlike(post)
    redirect_to root_path
  end

  private

  def post
    @_post ||= Post.find(params[:id])
  end
end