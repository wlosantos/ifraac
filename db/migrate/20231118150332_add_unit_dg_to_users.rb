class AddUnitDgToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unit_dg, :integer
    add_foreign_key :users, :units, column: :unit_dg, primary_key: :unit_dg
  end
end
