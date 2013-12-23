class PositionController < ApplicationController

  expose(:order)
  expose(:spot)
  expose(:item)
  expose(:position)

  def add
    new_position = Position.new(
      order_id: order.id,
      item_id: item.id
      )
    new_position.save
    redirect_to spot_order_path(spot, order), notice: "Added <strong>#{item.name}</strong>".html_safe
  end

  def destroy
    position.destroy
    redirect_to spot_order_path(spot, order), notice: 'Position removed successfully!'
  end

end
