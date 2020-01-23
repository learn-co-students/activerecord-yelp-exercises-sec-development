class ChangeNameOfRestaurants < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :name, :string, null: false
  end
end
