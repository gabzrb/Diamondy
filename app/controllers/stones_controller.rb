class StonesController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_stone, only: [:show]

  def index
    @stones = Stone.all
  end

  def new
    @stone = Stone.new
  end

  def show
    @photos = []
    @photos << @stone.product.photo if @stone.product.photo.url
    @photos << @stone.product.photo1 if @stone.product.photo1.url
    @photos << @stone.product.photo2 if @stone.product.photo2.url
    @photos << @stone.product.photo3 if @stone.product.photo3.url
  end

  def create
    @stone = Stone.new(stone_params)
    @stone.product_id = @product.id
    if @stone.save!
      redirect_to stone_path(@stone)
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
