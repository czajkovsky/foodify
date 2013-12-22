class OrdersController < ApplicationController

  expose :spot
  expose :order
  expose :orders

  before_filter :is_worker?, only: [:kitchen]

  def kitchen
  end

  def new
    if can_order?(spot.client_id)
      new_order = Order.new(
        client_id: spot.client_id,
        waiter_id: spot.waiter_id,
        spot_id: spot.id,
        amount: 0,
        state: 'new'
        )
      new_order.save
      redirect_to spot_order_path(spot, new_order)
    else
      redirect_to spots_path, notice: 'Sorry, you have some new (not sent to kitchen) orders.'
    end
  end

  def send_to_kitchen
    order.update_attributes(state: 'pending')
    redirect_to spots_path, notice: "Order ##{order.id} sent to kitchen!"
  end

  def destroy
    order.destroy
    redirect_to spot_path(spot)
  end

private

  def can_order? client
    Order.where(client_id: client, state: 'new').count == 0
  end

end
