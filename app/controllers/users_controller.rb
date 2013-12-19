class UsersController < ApplicationController

  expose(:user)
  expose(:users)

  before_filter :is_worker?

  def index
  end

end
