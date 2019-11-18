module PostHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest user.email
    avatar_url = "https://api.adorable.io/avatars/150/#{email_digest}"
    image_tag avatar_url
  end
end