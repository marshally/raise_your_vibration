class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find(session[:user_id])
    end
  rescue ActiveRecord::RecordNotFound
    @current_user = nil
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end
end
