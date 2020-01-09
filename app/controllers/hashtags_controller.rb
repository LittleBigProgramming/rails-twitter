# frozen_string_literal: true
class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = Post
               .joins("LEFT JOIN text_posts ON content_type = 'TextPost' AND content_id = text_posts.id")
               .where('text_posts.body LIKE ?', "%##{@hashtag}%")
  end
end
