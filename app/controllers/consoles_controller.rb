class ConsolesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :user_list
  before_action :console_list, only: %i[show edit update destroy]


  def index
    if params[:query].present?
      @consoles = Console.search_by_name(params[:query])
    else
      @consoles = Console.all
    end
  end

  def show
    @rental = @console.rentals[0]
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
    if @console.update(console_params)
      redirect_to @console, notice: 'Console was successfully updated 👍'
    else
      render :new
    end
  end

  def destroy
    @console.destroy
    redirect_to profile_path, notice: 'Console was successfully deleted 👍'
  end

  private

  def user_list
    @user = current_user
  end

  def console_list
    @console = Console.find(params[:id])
  end

  def console_params
    params.require(:console).permit(:name, :price_per_day, :min_rental_time, :max_rental_time, :description, :photo)
  end
end
