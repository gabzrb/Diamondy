class StonesController < ApplicationController
  before_action :set_product, only: [:new, :create, :edit]
  before_action :set_stone, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:query].present?
      @stones = Stone.by_size(Stone::QUALIFICATIONS[Stone::QUALIFICATIONS.index(params[:query][:size_from])..Stone::QUALIFICATIONS.index(params[:query][:size_to])]) &
      Stone.by_polish(Stone::QUALIFICATIONS[Stone::QUALIFICATIONS.index(params[:query][:polish_from])..Stone::QUALIFICATIONS.index(params[:query][:polish_to])]) &
      Stone.by_color(Stone::COLORS[Stone::COLORS.index(params[:query][:color_from])..Stone::COLORS.index(params[:query][:color_to])]) &
      Stone.by_purity(Stone::PURITY[Stone::PURITY.index(params[:query][:purity_from])..Stone::PURITY.index(params[:query][:purity_to])]) &
      Stone.by_symetry(Stone::QUALIFICATIONS[Stone::QUALIFICATIONS.index(params[:query][:symetry_from])..Stone::QUALIFICATIONS.index(params[:query][:symetry_to])])
      # Need to be done !!!!!
     if params[:query][:weight_from] != ""
       @stones = @stones & (params[:query][:weight_to] != "" ? Stone.by_weight(params[:query][:weight_from].to_f, params[:query][:weight_to].to_f) : Stone.by_weight(params[:query][:weight_from].to_f))
     end

     # TODO
     # Shape, Fluo, Certificate
      @stones = @stones & Stone.where(shape: params[:query][:shape],
                            fluo: params[:query][:fluo],
                            certificate: params[:query][:certificate])
    else
      @stones = Stone.all
    end
  end

  def new
    @stone = Stone.new
  end

  def show
    @photos = []
    @stone.product.product_attachments.each{ |a| @photos << a.photo}
  end

  def create
    @stone = Stone.new(stone_params)
    @stone.product_id = @product.id
    if @stone.save!
      redirect_to stone_path(@stone)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if @product.user != current_user
  end

  def update
    @stone.update(stone_params)
    redirect_to dashboard_path
  end

  private

  def set_stone
    @stone = Stone.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def stone_params
    params.require(:stone).permit(:category, :size, :weight, :color, :purity, :certificate, :shape, :symetry, :polish, :fluo)
  end
end
