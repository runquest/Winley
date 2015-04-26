class ChangeTablesNames < ActiveRecord::Migration
  def change
  	rename_table :bottles_events, :flights
  	rename_table :user_reviews, :reviews
  	rename_table :events_users, :attendances
  end
end
