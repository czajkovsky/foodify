class Spot < ActiveRecord::Base
  attr_accessible :balance, :client, :status, :waiter
end
