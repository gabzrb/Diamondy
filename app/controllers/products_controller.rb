class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    product_conection(@products)
  end

  def show
  end

  def new
    @product = Product.new
    @product_attachment = ProductAttachment.new
  end

  def create
    @product = Product.new(product_params)
    @product_attachment = ProductAttachment.create(params[:product][:product_attachment])
    @product.user = current_user
    @product.element = params[:product][:element]
    if @product.save!
      @product_attachment.product = @product
      @product_attachment.save
      raise
      check_product_redirection(@product)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if @product.user != current_user
    @obj = @product.conect
  end

  def update
    @product.update(product_params)
    if @product.save
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

  def product_conection(products)
    products.each do |product|
      if (product.jewel.nil? && product.stone.nil? && product.watch.nil? && product.special_request.nil?)
        product.destroy!
      end
    end
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

  # def product_attachment_params
  #   params.require(:product_attachment).permit(:photo)
  # end

  def product_params
    params.require(:product).permit(:price, :description, :element, :product_attachment)
  end
end
