class ItemsController < ApplicationController
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    # 出品者かどうか念のため判定
    if item.seller_id == current_user.id
      item.destroy
      # 今のところトップページ仮置き
      redirect_to root_path
    end
  end
  
end
