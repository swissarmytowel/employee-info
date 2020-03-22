class SessionsController < ApplicationController
  def new
    if is_logged_in?
      flash.now[:danger] = "Already Logged in as #{get_current_user.name}!"
      render 'static_pages/home'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Ivalid email and/or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
