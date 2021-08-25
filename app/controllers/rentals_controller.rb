class RentalsController < ApplicationController

  def new
    @console = Console.find(params[:console_id])
    @owner = User.find(@console.user_id)
    @rental = Rental.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
