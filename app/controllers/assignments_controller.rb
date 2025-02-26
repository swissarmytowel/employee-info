class AssignmentsController < ApplicationController
    # Whe only ever need to destroy assignment
    def destroy
        assignment = Assignment.find(params[:id])
        employee = assignment.employee
        project = assignment.project
        employee.remove_assignment(project)
        redirect_to edit_employee_path(employee)
    end
end