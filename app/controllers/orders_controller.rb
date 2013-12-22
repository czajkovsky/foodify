class OrdersController < ApplicationController

  expose :spot
  expose :order
  expose :orders

  before_filter :is_worker?, only: [:kitchen]

  def kitchen
  end

  def new
    new_order = Order.new(
      client_id: spot.client_id,
      waiter_id: spot.waiter_id,
      spot_id: spot.id,
      amount: 0,
      state: 'new'
      )
    new_order.save
    redirect_to spot_order_path(spot, new_order)
  end

  def destroy
    order.destroy
    redirect_to spot_path(spot)
  end

end
