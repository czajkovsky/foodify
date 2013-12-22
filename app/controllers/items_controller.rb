class ItemsController < ApplicationController

  expose :item
  expose :items

  before_filter :is_worker?, except: [:index, :show]

  def create
    if item.save
      redirect_to item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if item.save
      redirect_to item, notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    item.destroy
    redirect_to items_path
  end

end
