class JewelsController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_jewel, only: [:show]

  def index
    @jewels = Jewel.all
  end

  def new
    @jewel = Jewel.new
  end

  def show
  end

  def create
    @jewel = Jewels.new(jewel_params)
    @jewels.product_id = @product.id
    if @jewel.save!
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_jewel
    @jewels = Jewel.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def jewel_params
    params.require(:jewel).permit(:category, :state, :brand)
  end
end
