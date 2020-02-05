module UsersHelper
  def admin?
    user_signed_in? && current_user.admin?
  end

  # Avatar
  def user_avatar(user, size=60)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, alt: user.first_name + '' + user.last_name, size: size)
    end
  end

  # Admins or Vip’s can view all users as well as create users.
  #def authenticate_admin
  #  unless user_signed_in? && current_user.admin? || user_signed_in? && current_user.vip?
  #  redirect_to_rails_admin_path, alert: "You are not authorized to view this page"
  #end
end