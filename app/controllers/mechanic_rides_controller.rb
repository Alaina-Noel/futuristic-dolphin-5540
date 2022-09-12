class MechanicRidesController < ApplicationController

  def create
    @mechanic = Mechanic.find(params[:id])
    @mechanic_ride = MechanicRide.create!(ride_id: mechanic_ride_params[:ride_id], mechanic_id: @mechanic.id)

    redirect_to "/mechanics/#{@mechanic.id}"
  end

  private
  def mechanic_ride_params
    params.permit(:ride_id, :id) #try action too if this doens't work
  end
end