class CreateRushEvents < ActiveRecord::Migration
  def change
    create_table :rush_events do |t|
      t.string :event_name
      t.string :event_description
      t.string :location
      t.datetime :event_time
      t.string :semester

      t.timestamps
    end
  end
end
