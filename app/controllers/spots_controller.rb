class SpotsController < ApplicationController

  before_filter :is_worker?, only: [:create, :destroy]

  expose :spot
  expose :spots

  expose (:my_spot) { Spot.where(client_id: current_user.id) }

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
    redirect_to spots_path
  end

  def assign_to_client
    spot.update_attributes(client_id: current_user.id)
    redirect_to spots_path
  end

end
