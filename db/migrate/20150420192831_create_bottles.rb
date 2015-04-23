class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :grape
      t.date :vintage
      t.string :winery
      t.text   :description
      
      t.timestamps
    end
  end
end
