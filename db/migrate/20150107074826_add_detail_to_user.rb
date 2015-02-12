class AddDetailToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, index: true, unique: true
  end
end
