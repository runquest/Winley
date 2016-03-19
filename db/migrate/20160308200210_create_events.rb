class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :title, null: false, limit: 100
      t.string :venue, null: false, limit: 100
      t.date :date, null: false
      t.integer :duration, null: false
      t.string :event_image, limit: 256
      t.text :description

      t.timestamps null: false
    end

    add_index :events, [:title, :date], :unique => true, name: :ui_events
    add_index :events, [:venue, :date], :unique => true, name: :ui2_events
 
    add_foreign_key :events, :users, name: :fk_events_on_user_id
    add_index :events, [:user_id], name: :i_events_on_user_id
  end
end
