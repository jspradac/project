class CreateRestaurantsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_users do |t|
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
end
