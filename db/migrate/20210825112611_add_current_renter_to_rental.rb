class AddCurrentRenterToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :current_renter_id, :integer
  end
end
