class SpecialRequestsController < ApplicationController
  before_action :set_product, only: [:new, :create, :edit]
  before_action :set_special_request, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @special_requests = SpecialRequest.search(params[:query][:description])
    else
      @special_requests = SpecialRequest.all
    end
  end

  def new
    @special_request = SpecialRequest.new
  end

  def show
    @photos = []
    @special_request.product.product_attachments.each{ |a| @photos << a.photo}
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

  def edit
    redirect_to root_path if @product.user != current_user
  end

  def update
    @special_request.update(special_request_params)
    redirect_to dashboard_path
  end


  private

  def set_special_request
    @special_request = SpecialRequest.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def special_request_params
    params.require(:special_request).permit(:categorie, :description)
  end
end
