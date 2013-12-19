class UsersController < ApplicationController

  before_filter :authenticate_user!
  expose(:user)
  expose(:users)

  def index
  end

end
