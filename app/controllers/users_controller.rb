class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  def show
    redirect_to dashboard_path if current_user == @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
