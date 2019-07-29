class JewelsController < ApplicationController
  before_action :set_product, only: [:new, :create, :edit]
  before_action :set_jewel, only: [:show, :edit, :update]

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
    if @jewel.save
      redirect_to jewel_path(@jewel)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if @product.user != current_user
  end

  def update
    @jewel.update(jewel_params)
    redirect_to dashboard_path
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
