class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :gossip, foreign_key: true
      t.references :author, index: true
      t.string :content
      t.timestamps
    end
  end
end
