class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :unit_dg, null: false, index: { unique: true }
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
