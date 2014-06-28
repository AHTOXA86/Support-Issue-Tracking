class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    if user_signed_in?
    if current_user.accaunt_type == User::ADMIN_USER
      redirect_to admin_users_path
    else
      redirect_to users_index_url
    end
      end
  end
end
