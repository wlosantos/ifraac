class CreateTalkChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :talk_channels do |t|
      t.string :name, null: true
      t.integer :kinds, null: false, default: 0
      t.boolean :is_blocked, null: false, default: false
      t.boolean :read_only, null: false, default: false
      t.boolean :moderated, null: false, default: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.boolean :closed, null: false, default: false
      t.datetime :closed_at, default: nil

      t.timestamps
    end
  end
end
