class Spot < ActiveRecord::Base
  attr_accessible :balance, :client, :state, :waiter_id, :client_id, :name
  belongs_to :waiter
  belongs_to :client
  has_many :orders

  def has_client?
    self.client.present?
  end

  def has_waiter?
    self.waiter.present?
  end

  def pending?
    self.state == 'pending'
  end

  def payed?
    self.balance == 0
  end

  def finished?
    self.state == 'finished'
  end

  def balance
    -self.orders.sum('amount')
  end

end
