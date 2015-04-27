class AddColumnsBottles < ActiveRecord::Migration
  def change
  		
  		add_column :bottles, :label_image, :string
  		add_column :bottles, :year, :integer
  		add_column :bottles, :more_url, :string
  	 
  end
end
 