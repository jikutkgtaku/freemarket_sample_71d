class BrandsController < ApplicationController
  def index
    @brands = Brand.search(params[:brand])
    respond_to do |format|
      format.html
      format.json
    end
  end
end