module AvatarHelper

  def avatar(user)
    email_digest = Digest::MD5.hexdigest user.email
    avatar_url = "https://api.adorable.io/avatars/150/#{email_digest}"
    image_tag avatar_url,
              class: 'w-20 h-20 rounded-full mr-4',
              alt: "Avatar of #{user.username}",
              title: "Avatar of #{user.username}"
  end

end