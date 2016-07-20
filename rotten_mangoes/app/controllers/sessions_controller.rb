class SessionsController < ApplicationController
  before_filter :cant_signup_or_login, except: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  # def impersonate
  #   session[:admin_id] = session[:user_id]
  #   # verify we're an admin
  #   # do a login for the params[:user] and make that the new user_id
  #   redirect_to params[:redirect]
  # end

  # def end_impersonate
  #   session[:user_id] = session[:admin_id]
  #   redirect_to admin_user_path
  # end

  def destroy
    # session[:user_id] = nil
    session.delete(:user_id)
    redirect_to movies_path, notice: "Adios!"
  end
end
