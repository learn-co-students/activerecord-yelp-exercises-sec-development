class AddPriceAndCostToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :price, :float
    add_column :dishes, :cost, :float
  end
end
