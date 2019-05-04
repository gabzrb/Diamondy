class AnnoncesController < ApplicationController
  def new
    @annonces = Annonce.all
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    @annonce.user = current_user
    if annonce.save!
      redirect_to new_annonce_path
    else
      render :new
    end
  end

  private

  def annonce_params
    params.require(:annonce).permit(:category, :description)
  end

end
