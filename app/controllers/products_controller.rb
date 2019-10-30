class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :product_check, only: [:index, :show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @product_attachment = @product.product_attachments.build
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    @product.element = traduct_element(params[:product][:element])
    if @product.save
      if params[:product_attachments]
        params[:product_attachments]['photo'].each do |photo|
          @product_attachment = @product.product_attachments.create!(photo: photo)
        end
      end
      check_product_redirection(@product)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if @product.user != current_user
    @obj = @product.conect
    @product_attachment = ProductAttachment.new
  end

  def update
    @product.update(product_params)
    if @product.save
      params[:product_attachments]['photo'].each do |photo|
        @product_attachment = @product.product_attachments.create!(photo: photo)
      end
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to dashboard_path
  end

  private

  def traduct_element(element)
    if element == "Bijoux"
      return "jewel"
    elsif element == "Diamant"
      return "stone"
    elsif element == "Montre"
      return "watch"
    else
      return "special_request"
    end
  end

  def product_check
    ApplicationHelper.product_conection
  end

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
    params.require(:product).permit(:name, :price, :description, :element, product_attachments_attributes: [:id, :product_id, :photo])
  end
end
