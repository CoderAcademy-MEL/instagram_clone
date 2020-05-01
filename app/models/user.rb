class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :posts

  validates_uniqueness_of :username
end
