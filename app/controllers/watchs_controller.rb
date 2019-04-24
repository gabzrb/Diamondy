class WatchsController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_watch, only: [:show]

  def new
    @watch = Watch.new
  end

  def show
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.product_id = @product.id
    if @watch.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def watch_params
    params.require(:watch).permit(:brand, :state, :model, :year, :material)
  end
end
