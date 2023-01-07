class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :transactions, class_name: 'Transaction', foreign_key: 'category_id'

  validates :name, presence: { strict: true }, length: { maximum: 50 }
  validates :icon, presence: { strict: true }, length: { maximum: 250 }
end
