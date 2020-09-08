class User < ActiveRecord::Base
    has_secure_password
    has_many :expenses
    validates :username, :email, presence: true
    validates :email, :username, uniqueness: true
end