class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @employees = @user.employees.paginate(page: params[:page], per_page: 15)
  
  end

  def create
    @user = User.new(get_user_params)
    if @user.save
      if is_logged_in?
        log_out
      end
      log_in @user
      flash[:success] = "User was successfully created! Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    def get_user_params
      params.require(:user).permit(:name, :email, :password, 
        :password_confirmation)
    end
end
