class Console < ApplicationRecord
  belongs_to :user

  validates :user, :price_per_day, :min_rental_time, :max_rental_time, presence: true
  validates :name, length: { minimum: 6 }
end
