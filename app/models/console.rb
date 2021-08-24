class Console < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, length: { minimum: 6 }
end
