class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firt_name, :string
  end
end
