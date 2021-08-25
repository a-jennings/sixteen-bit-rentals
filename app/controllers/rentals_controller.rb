class RentalsController < ApplicationController

  def new
    @console = Console.find(params[:console_id])
  end

  def edit
  end

  def create
  end

  def update
  end
end
