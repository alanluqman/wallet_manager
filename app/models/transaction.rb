class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category, class_name: 'Category'

  validates :name, :amount, presence: { strict: true }
end
