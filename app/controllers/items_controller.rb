class ItemsController < ApplicationController

  expose :item
  expose :items

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
    redirect_to item_path
  end

end
