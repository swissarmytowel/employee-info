class EmployeesController < ApplicationController
    # before_action only: [:edit, :destroy, :create, :update]
    def new
        @employee = get_current_user.employees.build if is_logged_in?
    end
    
    def create
        @employee = get_current_user.employees.build(employee_params)
        if @employee.save
            redirect_to  get_current_user
        else
            render 'new'
        end
    end

    def destroy
    end

    private
        def employee_params
            params.require(:employee).permit(:name, :telegram_id)
        end
end
