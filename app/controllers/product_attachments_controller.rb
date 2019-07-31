class ProductAttachmentsController < ApplicationController
 before_action :set_attachement

  def edit
    raise
  end

  def update
  end

  def destroy
    product = @att.product
    @att.destroy
    redirect_to edit_product_path(product)
  end

  private

  def set_attachement
    @att = ProductAttachment.find(params[:id])
  end
end
