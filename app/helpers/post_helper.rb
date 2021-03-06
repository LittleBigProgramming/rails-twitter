# frozen_string_literal: true

module PostHelper
  def post_form_with(post_type)
    form_with scope: Post.new, url: post_type.new,
              class: 'w-full bg-white' do |form|
      form.fields_for(:content) { |content_form| yield(content_form) } +
        form.submit('Post',
                    class: "flex-shrink-0 bg-teal-500 hover:bg-teal-700 border-teal-500 hover:border-teal-700 text-sm border-4
             text-white py-1 px-4 ml-4 rounded cursor-pointer")
    end
  end

  def like_button(post)
    if current_user.liked?(post)
      link_to 'Unlike',
              unlike_post_path(post),
              method: :delete,
              class: 'font-bold text-teal-600 hover:text-teal-400'
    else
      link_to 'Like', like_post_path(post),
              method: :post,
              class: 'font-bold text-teal-600 hover:text-teal-400'
    end
  end

  def autolink(text)
    text
      .gsub(/@\w+/, &method(:mention_link))
      .gsub(/#\w+/, &method(:hashtag_link))
      .html_safe
  end

  private

  def hashtag_link(hashtag)
    link_to hashtag,
            hashtag_path(hashtag[1..-1]),
            class: 'text-blue-600 hover:text-blue-400 hover:underline'
  end

  def mention_link(mention)
    link_to mention,
            user_path(mention[1..-1]),
            class: 'text-blue-600 hover:text-blue-400 hover:underline'
  end
end
