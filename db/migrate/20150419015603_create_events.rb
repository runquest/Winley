class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_title
      t.string :event_venue
      t.date :event_date
      t.time :duration
      t.string :description

      t.timestamps
    end
  end
end
