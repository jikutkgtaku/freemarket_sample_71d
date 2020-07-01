class BrandsController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    @brands = Brand.where(['name LIKE ?', "%#{params[:keyword]}%"] ).limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end
end