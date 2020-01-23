class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.text :name
      t.integer :restaurant_id
    end
  end
end
