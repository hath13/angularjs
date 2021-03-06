class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :user, index: true
      t.index :title
      t.timestamps
    end
  end
end
