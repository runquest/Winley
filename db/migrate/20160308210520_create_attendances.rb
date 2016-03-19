class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end
    add_index :attendances, [:user_id, :event_id], :unique => true, name: :ui_attendances
 
    add_foreign_key :attendances, :users, on_delete: :cascade, name: :fk_attendances_on_user_id
    add_index :attendances, [:user_id], name: :i_attendances_on_user_id
 
    add_foreign_key :attendances, :events, on_delete: :cascade, name: :fk_attendances_on_event_id
    add_index :attendances, [:event_id], name: :i_attendances_on_event_id

  end
end
