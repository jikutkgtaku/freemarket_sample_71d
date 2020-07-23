class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  end

  def show
  end

  def items
    @items = Item.where("seller_id = #{current_user.id}")
  end

  def logout
  end
    
  private
  def set_user
    @user = User.find(params[:id])
  end
end
