class CreateDetailEmails < ActiveRecord::Migration
  def change
    create_table :detail_emails do |t|
      t.string :from
      t.string :to
      t.text :body
      t.string :title
      t.references :user, index: true
      t.boolean :is_read
      t.timestamps
    end
  end
end
