class DashboardController < ApplicationController

  expose (:my_spot) { Spot.where(client_id: current_user.id).first }
  expose (:my_spots) { Spot.where(waiter_id: current_user.id) }
  expose (:spots)

  def index
  end

end
