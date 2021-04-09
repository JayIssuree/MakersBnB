class Listing < ActiveRecord::Base

    belongs_to :user

    validates :user_id, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :ppn, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

end