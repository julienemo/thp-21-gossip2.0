class CreateLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :gossip, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :likes
  end
end
