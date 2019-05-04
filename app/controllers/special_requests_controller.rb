class SpecialRequestsController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_special_request, only: [:show]

  def new
    @special_request = SpecialRequest.new
  end

  def show
  end

  def create
    @special_request = SpecialRequest.new(special_request_params)
    @special_request.product_id = @product.id
    if @special_request.save!
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_special_request
    @special_request = SpecialRequest.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def special_request_params
    params.require(:special_request).permit(:type)
  end
end
