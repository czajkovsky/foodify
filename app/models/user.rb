class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  WAITER = 'waiter'.freeze
  COOK = 'cook'.freeze
  ROLES = [WAITER, COOK].freeze

  def worker?
    ROLES.include?(self.role) ? true : false
  end

  def waiter?
    self.role == WAITER ? true : false
  end

  def cook?
    self.role == COOK ? true : false
  end

end
