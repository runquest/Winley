class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    t.string :email
    t.string :fname
    t.string :lname
    t.string :password_digest
    t.string :avatar_url
    t.date :birthday
    t.text :description

    end
  end
end
