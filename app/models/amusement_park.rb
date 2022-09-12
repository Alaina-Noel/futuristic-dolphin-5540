class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha_ordered
    rides.order(:name)
  end
end