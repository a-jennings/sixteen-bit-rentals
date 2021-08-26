class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :console

  validates :start_rental_date, :end_rental_date, presence: true
  validate :date_logic

  def date_logic
    if Date.today > start_rental_date
      errors.add(:start_rental_date, "cannot be in the past")
    elsif Date.today > end_rental_date
      errors.add(:end_rental_date, "cannot be in the past")
    end

    if start_rental_date > end_rental_date
      errors.add(:end_rental_date, "cannot be before start date")
    end
  end
end
