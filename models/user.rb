class User < ActiveRecord::Base

    has_many :listings, dependent: :destroy
    has_many :bookings, :through => :listings
    has_many :requests, :through => :bookings

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

end