class ItemsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @category = Category.where(ancestry: nil).order("id ASC").limit(13)
  end

  def category_children
    @category_children = Category.find(params[:productcategory]).children
  end

  def category_grandchildren 
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

end
