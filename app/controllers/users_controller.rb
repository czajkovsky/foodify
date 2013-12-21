class UsersController < ApplicationController

  expose(:user)
  expose(:users)

  before_filter :is_worker?

  def update
    if user.save
      redirect_to user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    user.destroy
    redirect_to users_path
  end

end
