class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :type
      t.string :grape
      t.string :vintage
      t.string :winery
      t.string :region
      t.string :alcohol
      t.string :price
      t.text   :description
      
      t.timestamps
    end
  end
end
