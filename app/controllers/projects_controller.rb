class ProjectsController < ApplicationController
    # before_action :get_current_employee

    def new
        @project = Project.new
    end

    def create
        @project = Project.find_by(project_params)
        @employee = Employee.find(params[:project][:employee_id])

        if @project
            @employee.assign(@project)
        else
            @project = Project.new(project_params)
            if @project.save
                @employee.assign(@project)
            else
                flash[:danger] = "Project can`t be added"
            end
        end
        redirect_to edit_employee_path(@employee)
    end

    # def destroy
    #     project = Project.find(params[:id])
    #     @employee = Assignment.find_by(project_id: project.id).employee
    #     @employee.remove_assignment(project)
    #     redirect_to edit_employee_path(@employee)
    # end

    private
        def project_params
            params.require(:project).permit(:name, :telegram_id)
        end

        def get_current_employee
        end
end
