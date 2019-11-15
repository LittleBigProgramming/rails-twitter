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
    case params[:shout][:content_type]
    when 'text' then TextPost.new(text_content_params)
    when 'image' then TextPost.new(image_content_params)
    end
  end

  def text_content_params
    params.require(:post).require(:content).permit(:body)
  end

  def image_content_params
    params.require(:post).require(:content).permit(:image)
  end

  def redirect_options_for(post)
    if post.persisted?
      { notice: 'Posted successfully' }
    else
      { alert: 'Could not post' }
    end
  end
end