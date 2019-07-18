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
    @product.element = params[:product][:element]
    if @product.save!
      check_product_redirection(@product)
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

  def check_product_redirection(product)
    if !(product.element.empty?)
     redirect_to "/products/#{product.id}/#{product.element}s/new"
    else
      render :new
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    #TODO
    params.require(:product).permit(:price, :description, :element, :photo, :photo1, :photo2, :photo3, :photo_cache)
  end
end
