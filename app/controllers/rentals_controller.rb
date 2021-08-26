class RentalsController < ApplicationController

  def new
    @console = Console.find(params[:console_id])
    @owner = User.find(@console.user_id)
    @rental = Rental.new
  end

  def create
    @console = Console.find(params[:console_id])
    @owner = User.find(@console.user_id)
    @rental = Rental.new(start_rental_date: rental_params[:start_rental_date],
                         end_rental_date: rental_params[:end_rental_date],
                         console_id: @console.id,
                         user_id: @owner.id,
                         current_renter_id: current_user.id)
    if @rental.save
      redirect_to console_rental_path(@console.id, @rental)
    else
      render :new
    end
  end

  def show
    @console = Console.find(params[:console_id])
    @rental = Rental.where(console_id: params[:console_id])
  end

  def edit
    @console = Console.find(params[:console_id])
    @rental = Rental.where(console_id: params[:console_id])
    @owner = User.find(@console.user_id)
  end

  def update
    @console = Console.find(params[:console_id])
    @owner = User.find(@console.user_id)
    @rental.update(start_rental_date: rental_params[:start_rental_date],
                   end_rental_date: rental_params[:end_rental_date])
  end

  def destroy
  end

  private

  def rental_params
    params.require(:rental).permit(:current_rental_days, :start_rental_date, :end_rental_date)
  end
end
