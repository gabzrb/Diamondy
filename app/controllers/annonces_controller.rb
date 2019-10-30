class AnnoncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]
  before_action :set_annonce, only: [:edit, :update, :destroy]
  before_action :annonces_query, only: [:index, :new]

  def index
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.user = current_user
    if @annonce.save
      redirect_to annonces_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @annonce = Annonce.update(annonce_params)
    if @annonce.save!
      redirect_to new_annonce_path
    else
      render :update
    end
  end

  private

  def annonces_query
    @annonces = Annonce.all.order(:created_at).reverse.select {|a| a.checked}
    if params[:query]
      @annonces = Annonce.search(params[:query]).select {|a| a.checked}
    end
  end

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def annonce_params
    params.require(:annonce).permit(:category, :description)
  end
end
