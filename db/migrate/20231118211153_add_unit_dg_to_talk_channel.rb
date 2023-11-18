class AddUnitDgToTalkChannel < ActiveRecord::Migration[7.0]
  def change
    add_column :talk_channels, :unit_dg, :integer
    add_foreign_key :talk_channels, :units, column: :unit_dg, primary_key: :unit_dg
  end
end
