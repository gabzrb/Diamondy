class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :conditions_generales, :mentions_legales]

  def home
  end

  def dashboard
    ApplicationHelper.product_conection
    @products = current_user.products
  end

  def conditions_generales
  end

  def mentions_legales
  end
end
