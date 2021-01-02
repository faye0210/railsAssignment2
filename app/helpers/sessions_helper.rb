module SessionsHelper
  def current_user
    @current_user ||= User.find_bt(id: session[:user_id])
  end
  def logged_in?
    current_user.present?
  end
end
