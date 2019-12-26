module PostHelper

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
    text.gsub(/@\w+/) do |mention|
      link_to mention,
      user_path(mention[1..-1]),
      class: 'text-blue-600 hover:text-blue-400 hover:underline'
    end.html_safe
  end
end