class Booking < ActiveRecord::Base

    belongs_to :listing
    has_many :requests

    validates :date, presence: true

end