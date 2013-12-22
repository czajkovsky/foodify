class Order < ActiveRecord::Base
  belongs_to :spot
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

  def label_class
  end

end
