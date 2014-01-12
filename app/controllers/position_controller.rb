class PositionController < ApplicationController

  expose(:order)
  expose(:spot)
  expose(:item)
  expose(:position)

  def add
    if order.new?
      new_position = Position.new(
        order_id: order.id,
        item_id: item.id
        )
      new_position.save
      redirect_to spot_order_path(spot, order), notice: "Added <strong>#{item.name}</strong>".html_safe
    else
      redirect_to spot_order_path(spot, order), notice: "This order is not in new state!"
    end
  end

  def destroy
    if order.new?
      position.destroy
      redirect_to spot_order_path(spot, order), notice: 'Position removed successfully!'
    else
      redirect_to spot_order_path(spot, order), notice: "This order is not in new state!"
    end
  end

end
