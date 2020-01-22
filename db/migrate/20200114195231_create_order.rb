class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :orderer_id
      t.integer :restaurant_id
    end
  end
end
