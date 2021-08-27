class UsersController < ApplicationController
  def profile
    @user = current_user
    @consoles = current_user.consoles
    @rentals = Rental.where(current_renter_id: current_user.id)
    # raise
  end

  def show
    @user = User.find(params[:id])
    redirect_to profile_path if current_user == @user
    @consoles = @user.consoles
  end
end
