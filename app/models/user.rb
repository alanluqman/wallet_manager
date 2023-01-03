class User < ApplicationRecord
  has_many :categories, class_name: 'Category', foreign_key: 'author_id'
  has_many :transactions, class_name: 'Transaction', foreign_key: 'author_id'

  validates :name, presence: true
end
