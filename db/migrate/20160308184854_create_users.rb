class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 100
      t.string :fname, null: false, limit: 31
      t.string :lname, null: false, limit: 31
      t.string :password_digest, limit: 100
      t.string :avatar_url, limit: 100
      t.date :birthday
      t.text :description, limit: 2048

      t.timestamps null: false
    end
    add_index :users, [:email], :unique => true, name: :ui_users
  end
end
