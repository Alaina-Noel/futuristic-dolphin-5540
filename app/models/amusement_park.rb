class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha_ordered
    require 'pry' ; binding.pry
  end
end