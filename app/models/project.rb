class Project < ApplicationRecord
    # Setting up a many-many relationship using Assignments table
    has_many :assignments, dependent: :destroy
    has_many :employees, -> { distinct }, through: :assignments, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
