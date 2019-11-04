class PostsController < ApplicationController

  def create
    post = current_user.posts.create(post_params)
    redirect_to root_path, redirect_options_for(post)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def redirect_options_for(post)
    if post.persisted?
      { notice: 'Posted successfully' }
    else
      { alert: 'Could not post'}
    end
  end
end