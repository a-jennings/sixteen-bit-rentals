class RentalsController < ApplicationController
  before_action :gets_console
  before_action :gets_owner, only: %i[new create edit update]
  before_action :gets_rental, only: %i[show edit update destroy]

  def new
    @rental = Rental.new
  end

  def create
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

  def show; end

  def edit; end

  def update
    @rental.update(start_rental_date: rental_params[:start_rental_date],
                   end_rental_date: rental_params[:end_rental_date])
    if @rental.save
      redirect_to console_rental_path(@console.id, @rental)
    else
      render :new
    end
  end

  def destroy
    @rental.delete
    redirect_to console_path(@console)
  end

  private

  def gets_console
    @console = Console.find(params[:console_id])
  end

  def gets_owner
    @owner = User.find(@console.user_id)
  end

  def gets_rental
    @rental = Rental.where("console_id = ?", @console.id)[0]
  end

  def rental_params
    params.require(:rental).permit(:current_rental_days, :start_rental_date, :end_rental_date)
  end
end
