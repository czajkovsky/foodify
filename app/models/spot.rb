class Spot < ActiveRecord::Base
  attr_accessible :balance, :client, :state, :waiter_id, :client_id, :name
  belongs_to :waiter
  belongs_to :client

  STATES = ['free', 'in_use', 'finished'].freeze

end
