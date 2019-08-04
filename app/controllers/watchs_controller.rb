class WatchsController < ApplicationController
  before_action :set_product, only: [:new, :create, :edit]
  before_action :set_watch, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      @watchs = Watch.where(state: params[:query][:state],
                            material: params[:query][:material],
                            brand: params[:query][:brand])
    else
      @watchs = Watch.all
    end
  end

  def new
    @watch = Watch.new
  end

  def show
    @photos = []
    @watch.product.product_attachments.each{ |a| @photos << a.photo}
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

  def edit
    redirect_to root_path if @product.user != current_user
  end

  def update
    @watch.update(watch_params)
    redirect_to dashboard_path
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
