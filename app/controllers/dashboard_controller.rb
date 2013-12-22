class DashboardController < ApplicationController

  expose (:client_spot) { Spot.where(client_id: current_user.id).first }
  expose (:client_orders) { Order.where(client_id: current_user.id) }

  expose (:waiter_pending_spots) { Spot.where(state: 'pending') }
  expose (:waiter_spots) { Spot.where(waiter_id: current_user.id) }

  expose (:cook_pending_orders) { Order.where(state: 'pending') }
  expose (:cook_orders) { Order.where(cook_id: current_user.id) }

  expose (:spots)
  expose (:orders)

  def index
  end

end
