class CreateConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :consoles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :price_per_day
      t.integer :min_rental_time
      t.integer :max_rental_time

      t.timestamps
    end
  end
end
