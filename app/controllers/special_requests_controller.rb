class SpecialRequestsController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_special_request, only: [:show]

  def index
    @special_requests = SpecialRequest.all
  end

  def new
    @special_request = SpecialRequest.new
  end

  def show
    @photos = []
    @photos << @special_request.product.photo if @special_request.product.photo.url
    @photos << @special_request.product.photo1 if @special_request.product.photo1.url
    @photos << @special_request.product.photo2 if @special_request.product.photo2.url
    @photos << @special_request.product.photo3 if @special_request.product.photo3.url
  end

  def create
    @special_request = SpecialRequest.new(special_request_params)
    @special_request.product_id = @product.id
    if @special_request.save!
      redirect_to special_request_path(@special_request)
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
    params.require(:special_request).permit(:description)
  end
end
