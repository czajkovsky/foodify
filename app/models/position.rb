class Position < ActiveRecord::Base
  has_one :item
  belongs_to :order
  # attr_accessible :title, :body
  attr_accessible :order_id, :item_id

  def item item_id
    Item.where(id: item_id).first
  end

end
