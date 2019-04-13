class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      check_product_redirection(params[:product_type], @product)
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

  private

  def check_product_redirection(params, product)
    redirect_to "/products/#{product.id}/#{params}s/new"
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    #TODO
    params.require(:product).permit(:price, :description)
  end
end
