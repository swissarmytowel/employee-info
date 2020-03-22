class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(get_user_params)
    if @user.save
      flash[:success] = "User was successfully created!"
    else
      flash[:error] = "Something went wrong =("
      render 'new'
    end
  end

  private
    def get_user_params
      params.require(:user).permit(:name, :email, :passord, 
        :password_confirmation)
    end
end
