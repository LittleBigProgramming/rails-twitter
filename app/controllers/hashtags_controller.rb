# frozen_string_literal: true
class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = Post.search(term: "##{@hashtag}")
  end
end
