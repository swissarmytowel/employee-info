class Project < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :employees, through: :assignments

    validates :name, presence: true
end
