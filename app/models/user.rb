class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  has_many :restaurants_users
  has_many :restaurants, :through => :restaurants_users
end
