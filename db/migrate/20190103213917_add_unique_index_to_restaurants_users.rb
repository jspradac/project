class AddUniqueIndexToRestaurantsUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :restaurants_users, [:user_id, :restaurant_id], unique: true
  end
end
