class AdminsController < ApplicationController
  before_action :set_annonce, only: [:admin_a_check]
  before_action :set_product, only: [:admin_delete_product]

  def admin
    if current_user.admin
      @users = User.all
      @products = Product.all
      @annonces = Annonce.all
      @annonces_to_check = @annonces.select { |a| !a.checked }
    else
      redirect_to root_path
    end
  end

  def admin_a_check
    if current_user.admin
      if params[:activity] == "checked"
        @annonce.checked = true
        @annonce.save
        redirect_to admin_path
      elsif params[:activity] == "delete"
        @annonce.destroy
        redirect_to admin_path
      end
    else
      redirect_to root_path
    end
  end


  def admin_delete_product
    if current_user.admin
      raise
    else
      redirect_to root_path
    end
  end

  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def set_product
    @annonce = Product.find(params[:id])
  end
end
