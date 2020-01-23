class CreateDishOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_orders do |t|
      t.integer :order_id
      t.integer :dish_id
    end
  end
end
