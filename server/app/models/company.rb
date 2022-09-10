class Company < ApplicationRecord
  validates :name, :siren, presence: true
  validates :siren, format: { with: /\d{9}/, message: "only allows exactly 9 digits" }
end
