class Employee < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 80}
  validates :salary, presence: true
  validates :working_hours, presence: true
  validates :job, presence: true
end
