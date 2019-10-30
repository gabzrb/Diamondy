class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  def new
    @user = User.new
  end

  def create
    # Create the user from params
    @user = User.new(params[:user])
    UserMailer.welcome(@user).deliver_now if @user.save
  end

  def show
    redirect_to dashboard_path if current_user == @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
