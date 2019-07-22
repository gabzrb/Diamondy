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
    @photos = []
    @photos << @jewel.product.photo if @jewel.product.photo.url
    @photos << @jewel.product.photo1 if @jewel.product.photo1.url
    @photos << @jewel.product.photo2 if @jewel.product.photo2.url
    @photos << @jewel.product.photo3 if @jewel.product.photo3.url
  end

  def create
    @jewel = Jewel.new(jewel_params)
    @jewel.product_id = @product.id
    if @jewel.save!
      redirect_to jewel_path(@jewel)
    else
      render :new
    end
  end

  private

  def set_jewel
    @jewel = Jewel.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def jewel_params
    params.require(:jewel).permit(:category, :state, :brand)
  end
end
