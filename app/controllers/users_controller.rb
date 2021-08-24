class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  # def new
  # end

  # def create
  # end

  # def destroy
  # end

end
