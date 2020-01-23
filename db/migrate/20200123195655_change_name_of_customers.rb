class ChangeNameOfCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :name, :string, null: false
  end
end
