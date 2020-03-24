class User < ApplicationRecord
    # Setting up a one-many relationship with Employees
    has_many :employees, dependent: :destroy
    # Downcase emails before saving them
    before_save {self.email = email.downcase}
    validates :name, presence: true, uniqueness: { case_sensitive: true },
            length: {maximum: 50}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, 
            length: {maximum: 80}, format: { with: VALID_EMAIL_REGEX }

    validates :password, presence: true,  length: {minimum: 6}
    has_secure_password
end
