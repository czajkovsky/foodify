class Order < ActiveRecord::Base
  belongs_to :spot
  has_many :positions, dependent: :destroy
  attr_accessible :amount, :client_id, :cook_id, :state, :waiter_id, :spot_id

  def ready_to_cook?
    self.state == 'pending'
  end

  def ready_to_deliver? id
    self.state == 'finished' && self.waiter_id == id
  end

  def ready_to_finish? id
    self.state == 'cooking' && self.cook_id == id
  end

  def new?
    self.state == 'new'
  end

  def label_class
    classes = { 'new' => 'info', 'pending' => 'danger', 'cooking' => 'primary', 'finished' => 'warning', 'delivered' => 'success' }
    classes[self.state.to_s]
  end

  def current_amount
    sum = 0
    self.positions.each do |p|
      sum = sum + p.item(p.item_id).price
    end
    sum
  end

end
