class AddApprovedToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :approved?, :boolean
  end
end
