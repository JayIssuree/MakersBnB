class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :listing
      t.date :date
      t.boolean :booked, default: false
    end
  end
end
