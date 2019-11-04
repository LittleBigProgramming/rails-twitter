class DashboardsController < ApplicationController
  def show
    @post = Post.new
    @posts = current_user.posts
    render :show
  end
end