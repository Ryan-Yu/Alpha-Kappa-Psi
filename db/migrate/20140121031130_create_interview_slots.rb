class CreateInterviewSlots < ActiveRecord::Migration
  def change
    create_table :interview_slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :rushee_id
      t.string  :interview_type
      t.timestamps
    end
    add_index :interview_slots, [:rushee_id, :interview_type], unique: true
  end
end
