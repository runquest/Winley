class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.integer :region_id, null: false
      t.string :name, null: false, limit: 63
      t.text :description, limit: 2048

      t.timestamps null: false
    end
    add_index :wineries, [:name], :unique => true, name: :ui_wineries
    add_foreign_key :wineries, :regions, name: :fk_wineries_on_region_id
    add_index :wineries, [:region_id], name: :i_wineries_on_region_id
  end
end
