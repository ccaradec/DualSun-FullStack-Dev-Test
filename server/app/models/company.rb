class Company < ApplicationRecord
  has_many :installations

  validates :name, :siren, presence: true
  validates :siren, format: { with: /\d{9}/, message: "only allows exactly 9 digits" }
end
