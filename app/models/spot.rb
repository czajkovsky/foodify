class Spot < ActiveRecord::Base
  attr_accessible :balance, :client, :state, :waiter, :name

  STATES = ['free', 'in_use', 'finished'].freeze

end
