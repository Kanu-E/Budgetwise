class Expense < ActiveRecord::Base
    belongs_to :user
    validates :title, :amount, presence: true
end