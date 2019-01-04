class Restaurant < ActiveRecord::Base
  validates :place_id, uniqueness: true
  has_many :restaurants_users
  has_many :users, :through => :restaurants_users
end
