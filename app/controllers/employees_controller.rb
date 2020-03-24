class EmployeesController < ApplicationController
    # We need to setup the right employee from current user first
    before_action :set_up_employee, only: [:destroy, :edit]

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
        selected_employee_name = @employee.name
        @employee.destroy
        flash[:success] = "Employee #{selected_employee_name} was deleted!"
        redirect_to request.referrer || get_current_user
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to get_current_user
        else
            render edit_path
        end
    end

    private
        # Filter posted parameters
        def employee_params
            params.require(:employee).permit(:name, :telegram_id, :salary, :working_hours, :job)
        end

        # Set up current employee based on params passed and current user
        def set_up_employee
            @employee = get_current_user.employees.find_by(id: params[:id])
            redirect_to root_url if @employee.nil?
        end
end
