class Spot < ActiveRecord::Base
  attr_accessible :balance, :client, :state, :waiter_id, :client_id, :name
  belongs_to :waiter
  belongs_to :client

  def has_client?
    self.client.present?
  end

end
