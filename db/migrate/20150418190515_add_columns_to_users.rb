class AddColumnsToUsers < ActiveRecord::Migration
  def change
    
    add_column :users, :email, :string
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :password_digest, :string
    add_column :users, :region, :string
    add_column :users, :avatar_url, :string
    add_column :users, :age, :integer
    add_column :users, :description, :text

  end
end
