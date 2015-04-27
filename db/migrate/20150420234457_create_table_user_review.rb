class CreateTableUserReview < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
    
  		t.belongs_to :user, index: true
  		t.belongs_to :bottle, index: true
      t.integer :my_rating
      t.text :comment
      t.boolean :favorite
      
      t.timestamps null: false
    end
  end
end
