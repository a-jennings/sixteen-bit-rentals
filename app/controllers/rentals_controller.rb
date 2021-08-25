class RentalsController < ApplicationController
  def new
    @console = Console.find(params[:console_id])
    @owner = User.find(@console.user_id)
    @rental = Rental.new
  end

  def create
    @console = Console.find(params[:console_id])
    @owner = User.find(@console.user_id)
    @rental = Rental.new(start_rental_date: Date.today,
                         end_rental_date: Date.today + (params[:rental][:current_rental_days]).to_i,
                         console_id: @console.id,
                         user_id: @owner.id
                        )
    if @rental.save!
      redirect_to console_path(@console)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  private

  def rental_params
    params.require(:rental).permit(:current_rental_days)
  end
end
