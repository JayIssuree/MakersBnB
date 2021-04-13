require_relative 'booking'

class Listing < ActiveRecord::Base

    belongs_to :user

    validates :user_id, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :ppn, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    def create_booking_dates
        start_year = self.start_date.to_s[0,4].to_i
        start_month = self.start_date.to_s[4,2].to_i
        start_day = self.start_date.to_s[6, 2].to_i
        end_year = self.end_date.to_s[0,4].to_i
        end_month = self.end_date.to_s[4,2].to_i
        end_day = self.end_date.to_s[6, 2].to_i

        start_date = Date.new(start_year, start_month, start_day)
        end_date = Date.new(end_year, end_month, end_day)
        input_date = start_date
        
        until input_date == end_date
            count = 0
            Booking.create(
                listing_id: self.id,
                date: input_date
            )
            count += 1
            input_date = input_date.advance(days: count)
        end
    end

end