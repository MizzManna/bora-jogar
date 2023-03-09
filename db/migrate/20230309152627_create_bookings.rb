class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user_id, null: false, foreign_key: true
      t.references :field_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
