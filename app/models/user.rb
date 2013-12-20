class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :type
  # attr_accessible :title, :body

  WAITER = 'Waiter'.freeze
  COOK = 'Cook'.freeze
  ROLES = [WAITER, COOK].freeze

  def worker?
    ROLES.include?(self.type) ? true : false
  end

  def waiter?
    self.type == WAITER ? true : false
  end

  def cook?
    self.type == COOK ? true : false
  end

end
