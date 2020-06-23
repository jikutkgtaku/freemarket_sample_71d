class ItemsController < ApplicationController
  
  def index
  end

  def show
  end

  def create
    @item = Item.new(item_params)
  end
  
  private
  def item_params
    params.require(:item).permit(
      :name,
      :introduction,
      :category_id,
      :size_id,
      :brand_id,
      :condition_id,
      :shipping_fee_id,
      :shipping_way_id,
      :prefecture_id,
      :shipping_period_id,
      :price
    ).merge(seller_id: current_user.id)
  end
end
