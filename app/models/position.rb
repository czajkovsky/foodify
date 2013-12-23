class Position < ActiveRecord::Base
  has_one :item
  belongs_to :order
  # attr_accessible :title, :body
  attr_accessible :order_id, :item_id

end
