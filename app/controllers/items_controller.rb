class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    # itemクラスのインスタンスに関連づけられたImageクラスのインスタンスを作成
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
  
  private
  def item_params
  # fields_forを利用して作成されたフォームから来る値は、○○s_attributes: [:××]という形でparamsに入る
  # fields_forから送られてくるこのキーを持った情報を頼りに、railsが子モデルの更新・削除を行う
    params.require(:item).permit(:name, :price, images_attributes:  [:image, :_destroy, :id])
  end

end
