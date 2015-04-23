class CreateEvents < ActiveRecord::Migration
  def change
    
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.date :date
      t.integer :duration
      t.text :description

      t.timestamps
    end
  end
end
