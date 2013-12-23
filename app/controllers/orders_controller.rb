class OrdersController < ApplicationController

  expose :spot
  expose :order
  expose :orders
  expose :items
  expose (:newest_orders) { Order.find(:all, order: 'id DESC') }
  expose (:positions_in_order) { Position.where(order_id: order.id) }

  before_filter :is_worker?, only: [:kitchen]

  def kitchen
  end

  def cook
    if order.state == 'pending'
      order.update_attributes(state: 'cooking', cook_id: current_user.id)
      redirect_to root_path, notice: "You're cooking Order ##{order.id}"
    else
      redirect_to root_path, notice: "Sorry, order ##{order.id} was not in 'Pending' state!"
    end
  end

  def show_order
    order_spot = Spot.where(id: order.spot_id).first
    redirect_to spot_order_path(order_spot, order)
  end

  def finish
    if order.state == 'cooking' and order.cook_id == current_user.id
      order.update_attributes(state: 'finished', cook_id: nil)
      redirect_to root_path, notice: "Thanks man!"
    else
      redirect_to root_path, notice: "Sorry, order ##{order.id} was not in 'Cooking' state or you weren'r the right cook!"
    end
  end

  def deliver
    if order.state == 'finished'
      order.update_attributes(state: 'delivered')
      redirect_to root_path, notice: "Thanks man!"
    else
      redirect_to root_path, notice: "Sorry, order ##{order.id} was not in 'Finished' state!"
    end
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
      redirect_to root_path, notice: 'Sorry, you have some new (not sent to kitchen) orders.'
    end
  end

  def send_to_kitchen
    if order.state == 'new'
      order.update_attributes(state: 'pending', amount: order.current_amount)
      redirect_to root_path, notice: "Order ##{order.id} sent to kitchen!"
    else
      redirect_to root_path, notice: "Sorry, order ##{order.id} was not in 'New' state!"
    end
  end

  def destroy
    order.destroy
    redirect_to root_path, notice: 'Order removed successfully!'
  end

private

  def can_order? client
    Order.where(client_id: client, state: 'new').count == 0
  end

end
