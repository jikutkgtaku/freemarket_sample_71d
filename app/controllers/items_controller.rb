class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    # itemクラスのインスタンスに関連づけられたImageクラスのインスタンスを作成
    @item.images.new
  end

  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end
  
  def get_shipping_way
    @shipping_way = ShippingWay.find_all_by_group(params[:selected_fee])
  end

  private
  def item_params
  # fields_forを利用して作成されたフォームから来る値は、○○s_attributes: [:××]という形でparamsに入る
  # fields_forから送られてくるこのキーを持った情報を頼りに、railsが子モデルの更新・削除を行う
    params.require(:item).permit(
      # images_attributes:  [:image, :_destroy, :id],
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
      )
  end

end

