class Order < ActiveRecord::Base
  belongs_to :spot
  attr_accessible :amount, :client_id, :cook_id, :state, :waiter_id, :spot_id

  def ready_to_cook?
    self.state == 'pending'
  end

end
