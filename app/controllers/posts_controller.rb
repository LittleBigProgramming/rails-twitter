class PostsController < ApplicationController

  def create
    post = current_user.posts.create(post_params)
    redirect_to root_path, redirect_options_for(post)
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    { content: content_from_params }
  end

  def content_from_params
    params[:content_type].new(content_params)
  end

  def content_params
    params.require(:post).require(:content).permit!
  end

  def redirect_options_for(post)
    if post.persisted?
      { notice: 'Posted successfully' }
    else
      { alert: 'Could not post' }
    end
  end
end