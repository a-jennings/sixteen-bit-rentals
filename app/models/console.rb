class Console < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :name, :price_per_day, :min_rental_time, :max_rental_time, presence: true
  validates :name, length: { minimum: 6 }

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    # using: [:trigram]
    using: {
      tsearch: { prefix: true }
    }
end
