class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :sender, null: false
      t.references :receiver, null: false
      t.boolean :active

      t.timestamps
    end
    add_foreign_key :friendships, :players, column: :sender_id, primary_key: :id
    add_foreign_key :friendships, :players, column: :receiver_id, primary_key: :id
  end
end
