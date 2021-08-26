class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :profile
  def profile
    @user = current_user
    @consoles = current_user.consoles
    @rentals = current_user.rentals
    # raise
  end

  def show
    @user = User.find(params[:id])
    @consoles = @user.consoles
  end

  # def new
  # end

  # def create
  # end

  # def destroy
  # end
end
