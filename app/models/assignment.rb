# Model, that works as a join table between Projects and Employees
# to support a many-many relationship
class Assignment < ApplicationRecord
  belongs_to :employee
  belongs_to :project
end
