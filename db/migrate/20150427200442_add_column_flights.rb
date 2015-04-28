class AddColumnFlights < ActiveRecord::Migration
  def change
    add_column :flights, :id, :primary_key
  end
end