module UserHelper
  def follow_button(user)
    button_to 'follow', follow_user_path
  end
end