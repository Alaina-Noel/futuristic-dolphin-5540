class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience
    average(:years_experience)
  end

  def rides_by_thrill
    self.rides.order(thrill_rating: :desc)
  end
end