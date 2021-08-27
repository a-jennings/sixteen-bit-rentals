class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :address, presence: true
  validates :first_name, :last_name, format: { with: /\A([a-z]+[ \-.,']*)+\z/i,
                                               message: "Please use only letters from the latin alphabet, spaces, and punctuation: -.,'" }
  validates :phone_number, format: { with: %r{\A\(?\+?(\d+[ .\-/()]*)+\z},
                                     message: "Please use only numbers 0-9 and punctuation: +.-/()" }
  has_many :consoles, dependent: :destroy
  has_many :rentals
  has_one_attached :photo
end
