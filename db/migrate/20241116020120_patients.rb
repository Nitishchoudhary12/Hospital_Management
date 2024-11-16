class Patients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.string :address
      t.integer :age
      t.string :facing_issue
      t.string :gender
      t.string :phone_number
      t.string :current_medications
      t.string :status
      t.datetime :booking_day
      t.integer :booked_by
      t.string :consulted_doctor

      t.timestamps null: false
    end
  end
end
