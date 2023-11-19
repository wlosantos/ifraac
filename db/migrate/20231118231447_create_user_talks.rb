class CreateUserTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_talks do |t|
      t.integer :status, default: 0
      t.references :participant, null: false, foreign_key: { to_table: :users }
      t.references :conversation, polymorphic: true, null: false

      t.timestamps
    end
  end
end
