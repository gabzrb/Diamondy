class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
  end

  def dashboard
    @products = current_user.products
  end

  def contact
  end
end
