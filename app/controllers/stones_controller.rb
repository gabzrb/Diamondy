class StonesController < ApplicationController
  before_action :set_product, only: [:new, :create, :edit]
  before_action :set_stone, only: [:show, :edit, :update]

  def index
    @stones = Stone.all
  end

  def new
    @stone = Stone.new
  end

  def show
    @photos = []
    @stone.product.product_attachments.each{ |a| @photos << a.photo}
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

  def edit
    redirect_to root_path if @product.user != current_user
  end

  def update
    @stone.update(stone_params)
    redirect_to dashboard_path
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
