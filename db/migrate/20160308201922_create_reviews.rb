class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :bottle_id, null: false
      t.integer :my_rating, null: false
      t.text :comment
      t.boolean :favorite

      t.timestamps null: false
    end

    # add_index :reviews, [:user_id, :bottle_id], :unique => true, name: :ui_reviews
    add_index :reviews, [:user_id, :bottle_id], name: :ui_reviews
 
    add_foreign_key :reviews, :users, on_delete: :cascade, name: :fk_reviews_on_user_id
    add_index :reviews, [:user_id], name: :i_reviews_on_user_id
 
    add_foreign_key :reviews, :bottles, on_delete: :cascade, name: :fk_reviews_on_bottle_id
    add_index :reviews, [:bottle_id], name: :i_reviews_on_bottle_id

  end
end
