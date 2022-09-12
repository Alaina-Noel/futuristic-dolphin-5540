class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

 def open?
  self.open == true
 end

 def self.avg_thrill_rating
    average(:thrill_rating)
 end

end

