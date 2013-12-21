class Spot < ActiveRecord::Base
  attr_accessible :balance, :client, :state, :waiter_id, :name
  belongs_to :waiter

  STATES = ['free', 'in_use', 'finished'].freeze

end
