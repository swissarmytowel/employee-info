class User < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: true },
            length: {maximum: 80}
    validates :email, presence: true, uniqueness: { case_sensitive: false }, 
            length: {maximum: 80}, format: { with: ConstantData::VALID_EMAIL_REGEX }
end
