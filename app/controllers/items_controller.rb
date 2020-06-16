class ItemsController < ApplicationController
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: params[:id])
  end
  
end
