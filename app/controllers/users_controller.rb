class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User was successfully created!"
      redirect_to @user
    else
      flash[:error] = "Something went wrong =("
      render 'new'
    end
  end
end
