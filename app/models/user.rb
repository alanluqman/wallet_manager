class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, class_name: 'Category', foreign_key: 'author_id'
  has_many :transactions, class_name: 'Transaction', foreign_key: 'author_id'

  validates :name, presence: { strict: true }, length: { maximum: 100 }
  validates :email, presence: { strict: true }, length: { maximum: 130 }
  validates :password, presence: true
end
