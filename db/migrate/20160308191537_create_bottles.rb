class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.integer :winery_id, null: false
      t.string :name, null: false, limit: 100
      t.string :grape, null: false, limit: 100
      t.integer :vintage, null: false
      t.string :label_image, limit: 256
      t.string :more_url, limit: 256
      t.text :description, limit: 2048

      t.timestamps null: false
    end
    add_index :bottles, [:winery_id, :name, :grape, :vintage], :unique => true, name: :ui_bottles
    add_foreign_key :bottles, :wineries, name: :fk_bottles_on_winery_id
    add_index :bottles, [:winery_id], name: :i_bottles_on_winery_id
  end
end
