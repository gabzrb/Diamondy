class StonesController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_stone, only: [:show]

  def new
    @stone = Stone.new
  end

  def show
  end

  def create
    @stone = Stone.new(stone_params)
    @stone.product_id = @product.id
    if @stone.save!
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_stone
    @stone = Stone.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def stone_params
    params.require(:stone).permit(:category, :size, :weight, :color, :purity, :certificate)
  end
end
