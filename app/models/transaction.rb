class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category, class_name: 'Category'

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
