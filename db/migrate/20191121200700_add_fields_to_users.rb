class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :address, :text
    add_column :users, :photo, :string
  end
end
