class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  ROLES = ['cook', 'worker'].freeze

  def worker?
    ROLES.include?(self.role) ? true : false
  end

end
