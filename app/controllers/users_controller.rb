class UsersController < ApplicationController

  expose(:user)
  expose(:users)

  before_filter :is_worker?

  def index
  end

  def show
  end

  def update
    if user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    user.destroy
    redirect_to users_path
  end

end
