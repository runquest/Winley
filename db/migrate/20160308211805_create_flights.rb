class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :bottle_id, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end

    add_index :flights, [:bottle_id, :event_id], :unique => true, name: :ui_flights
 
    add_foreign_key :flights, :bottles, on_delete: :cascade, name: :fk_flights_on_bottle_id
    add_index :flights, [:bottle_id], name: :i_flights_on_bottle_id
 
    add_foreign_key :flights, :events, on_delete: :cascade, name: :fk_flights_on_event_id
    add_index :flights, [:event_id], name: :i_flights_on_event_id
  end
end
