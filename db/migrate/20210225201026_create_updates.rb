class CreateUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :updates do |t|
      t.integer :followers
      t.integer :user_id
      t.text :message
      t.float :sentiment
      t.string :user_handle

      t.timestamps
    end
  end
end
