class CreateBiscomments < ActiveRecord::Migration[5.2]
  def change
    create_table :biscomments do |t|
      t.references :comment, foreign_key: true
      t.references :author, index: true
      t.string :content
      t.timestamps
    end
  end
end
