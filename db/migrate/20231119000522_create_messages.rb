class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.integer :moderation_status, default: 0
      t.datetime :moderated_at
      t.datetime :refused_at
      t.references :moderator, null: true, foreign_key: { to_table: :users }
      t.references :response, null: true, foreign_key: { to_table: :messages }
      t.references :talk_channel, null: false, foreign_key: true
      t.references :talk, polymorphic: true, null: false

      t.timestamps
    end
  end
end
