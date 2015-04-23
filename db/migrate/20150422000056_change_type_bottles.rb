class ChangeTypeBottles < ActiveRecord::Migration
	def change
		rename_column :bottles, :type, :color
	end
end

