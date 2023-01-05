class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :transactions, class_name: 'Transaction', foreign_key: 'category_id'

  validates :name, :icon, presence: { strict: true }
end
