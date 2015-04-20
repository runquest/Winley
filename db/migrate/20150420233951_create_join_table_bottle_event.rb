class CreateJoinTableBottleEvent < ActiveRecord::Migration
  def change
    create_join_table :bottles, :events do |t|
      # t.index [:bottle_id, :event_id]
      # t.index [:event_id, :bottle_id]
    end
  end
end
