class AnnoncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_annonce, only: [:edit, :update, :destroy]

  def new
    @annonces = Annonce.all
    @annonce = Annonce.new
    if params[:query_type]
      @annonces = Annonce.where(category: params[:query_type])
    end
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.user = current_user
    if @annonce.save!
      redirect_to new_annonce_path
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

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def annonce_params
    params.require(:annonce).permit(:category, :description)
  end

end
