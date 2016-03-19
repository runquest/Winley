class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name, null: false, limit: 63
      t.string :location, null: false, limit: 31
      t.text :description, limit: 2048

      t.timestamps null: false
    end
    add_index :regions, [:name], :unique => true, name: :ui_regions
  end
end
