class Booking < ActiveRecord::Base

    belongs_to :listing

    validates :date, presence: true

end