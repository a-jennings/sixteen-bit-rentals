class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :console, null: false, foreign_key: true
      t.date :start_rental_date
      t.date :end_rental_date

      t.timestamps
    end
  end
end
