class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post
  validates :name, :alias, :email, :password, presence: true

end
