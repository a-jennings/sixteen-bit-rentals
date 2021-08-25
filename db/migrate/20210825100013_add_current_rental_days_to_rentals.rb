class AddCurrentRentalDaysToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :current_rental_days, :integer, default: 0
  end
end
