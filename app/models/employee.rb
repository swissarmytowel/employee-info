class Employee < ApplicationRecord
  belongs_to :user
  
  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 80}
  validates :salary, presence: true
  validates :working_hours, presence: true
  validates :job, presence: true

  # Assign project to employee
  def assign(project)
    projects << project
  end

  # Remove project from employee
  def remove_assignment(project)
    projects.delete(project)
  end

  # Test if project is assigned to employee
  def is_assigned?(project)
    projects.include?(project)
  end
end
