require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :admin_only, :pretend_user

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def cant_signup_or_login
    if current_user
      flash[:alert] = "You are already logged in."
      redirect_to movies_path
    end
  end

  # def pretend_user
  #   @pretend_user ||= User.find(params[:id])
  #   redirect_to params[:redirect]
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_only
    if !current_user.admin
      flash[:alert] = "You are not admin."
      redirect_to movies_path
    end
  end
end
