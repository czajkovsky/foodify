class SpotsController < ApplicationController

  before_filter :is_worker?, only: [:create, :destroy]

  expose :spot
  expose :spots

  expose (:my_spot) { Spot.where(client_id: current_user.id).first }

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

  def close
    if !current_user.has_spot?
      redirect_to spots_path, notice: "Sorry, you don't have any open spot!"
    else
      spot.update_attributes(client_id: nil, state: 'free', balance: 0)
      current_user.update_attributes(status: 'out')
      redirect_to spots_path, notice: "Spot successfully closed."
    end
  end

  def assign_to_client
    if current_user.has_spot?
      redirect_to spots_path, notice: "Sorry, you can't join more than one spot!"
    elsif spot.client_id.present?
      redirect_to spots_path, notice: 'Sorry, this spot is not free any more!'
    else
      spot.update_attributes(client_id: current_user.id, state: 'pending', balance: 0)
      current_user.update_attributes(status: 'at_table')
      redirect_to spots_path, notice: 'This spot is yours!'
    end
  end
end
