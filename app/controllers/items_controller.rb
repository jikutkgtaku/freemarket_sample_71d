class ItemsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @category = Category.where(ancestry: nil).order("id ASC")
  end

  def category_children
    @category_children = Category.find(params[:productcategory]).children
  end

  def category_grandchildren 
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

  def get_size
    select_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得
    if related_size_parent = select_grandchild.sizes[0]#孫カテゴリーの紐づくサイズ(親)があれば取得
      @sizes = related_size_parent.children#紐づいたサイズ(親)の子供の配列を取得
    else
      select_child = Category.find("#{params[:grandchild_id]}").parent #孫カテゴリーの親を取得
      if related_size_parent = select_child.sizes[0] #孫カテゴリーの親と紐づくサイズ(親)があれば取得
        @sizes = related_size_parent.children #紐づいたサイズ(親)の子供の配列を取得
      end
    end
  end
end
