class ChangeNameOfDishes < ActiveRecord::Migration[5.2]
  def change
    change_column :dishes, :name, :string, null: false
  end
end
