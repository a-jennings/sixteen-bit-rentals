class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  def home
    @consoles = Console.all
  end
end
