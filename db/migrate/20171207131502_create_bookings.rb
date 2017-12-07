class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
