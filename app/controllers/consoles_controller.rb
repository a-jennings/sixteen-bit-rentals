class ConsolesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :console_list, only: %i[show edit update]

  def index
    if params[:query].present?
      @consoles = Console.search_by_name(params[:query])
    else
      @consoles = Console.all
    end
  end

  def show
    @rental = true if Rental.where(console_id: @console.id).length.positive?
  end

  def new
    @console = Console.new
  end

  def create
    @console = Console.new(console_params)
    @console.user = current_user
    if @console.save
      redirect_to @console, notice: 'Console was succesfullly created 👍'
    else
      render :new
    end
  end

  def edit; end

  def update
    if console.update(console_params)
      redirect_to @console, notice: 'Console was successfully updated 👍'
    else
      render :new
    end
  end

  def destroy
    @console = console.destroy(params[:id])
    @console.destroy
    redirect_to consoles_path, notice: 'Console was successfully updated 👍'
  end

  private

  def console_list
    @console = Console.find(params[:id])
  end

  def console_params
    params.require(:console).permit(:name, :price_per_day, :min_rental_time, :max_rental_time)
  end
end
