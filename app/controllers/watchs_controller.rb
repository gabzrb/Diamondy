class WatchsController < ApplicationController
  before_action :set_product, only: [:new, :create]
  before_action :set_watch, only: [:show]

  def index
    @watchs = Watch.all
  end

  def new
    @watch = Watch.new
  end

  def show
    @photos = []
    @photos << @watch.product.photo if @watch.product.photo.url
    @photos << @watch.product.photo1 if @watch.product.photo1.url
    @photos << @watch.product.photo2 if @watch.product.photo2.url
    @photos << @watch.product.photo3 if @watch.product.photo3.url
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.product_id = @product.id
    if @watch.save!
      redirect_to watch_path(@watch)
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
