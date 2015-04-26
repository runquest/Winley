class EditUserTable < ActiveRecord::Migration
  def change

  	 add_reference :users, :organizer
    
  end
end
