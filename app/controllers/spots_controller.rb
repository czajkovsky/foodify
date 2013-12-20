class SpotsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_worker?, except: [:index, :show]

  def index
    @spots = Spot.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @spot = Spot.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @spot = Spot.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(params[:spot])

    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @spot = Spot.find(params[:id])

    respond_to do |format|
      if @spot.update_attributes(params[:spot])
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to spots_url }
    end
  end
end
