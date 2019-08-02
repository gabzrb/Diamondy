class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :conditions_generales, :mentions_legales]

  def home
  end

  def admin
    if current_user.admin
      @users = User.all
      @products = Product.all
    else
      redirect_to root_path
    end
  end

  def dashboard
    @products = current_user.products
  end

  def conditions_generales
  end

  def mentions_legales
  end
end
