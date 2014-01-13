class CreateRushApplications < ActiveRecord::Migration
  def change
    create_table :rush_applications do |t|
      t.string  :name
      t.string  :phone_number
      t.string  :email
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :country
      t.integer :zip_code
      t.string  :grade
      t.string  :first_major
      t.decimal :first_major_gpa, precision: 3,  scale: 2
      t.string  :second_major
      t.decimal :second_major_gpa, precision: 3,  scale: 2
      t.string  :third_major
      t.decimal :third_major_gpa, precision: 3,  scale: 2
      t.string  :minor
      t.decimal :cumulative_gpa, precision: 3, scale: 2
      t.boolean :intended_haas

      t.string  :academic_schedule
      t.string  :extracurricular_info

      t.attachment :cover_letter
      t.attachment :resume
      t.attachment :transcript
      t.attachment :additional_transcript
      t.attachment :photograph

      t.string  :found_through

      t.timestamps
    end
    add_index :rush_applications, :email, unique: true
  end
end
