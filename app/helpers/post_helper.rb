module PostHelper

  def avatar(user)
    email_digest = Digest::MD5.hexdigest user.email
    avatar_url = "https://api.adorable.io/avatars/150/#{email_digest}"
    image_tag avatar_url
  end

  def like_button(post)
    if current_user.liked?(post)
      link_to 'Unlike', unlike_post_path(post), method: :delete
    else
      link_to 'Like', like_post_path(post), method: :post
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