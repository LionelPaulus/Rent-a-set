module ApplicationHelper
  def avatar_url(user)
    user.avatar.url(:thumb)
  end
end
