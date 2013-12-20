class SpotsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_worker?, except: [:index, :show]

  expose :spot
  expose :spots

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if spot.save
      redirect_to spot, notice: 'Spot was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if spot.save
      redirect_to spot, notice: 'Spot was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    spot.destroy
  end

end
