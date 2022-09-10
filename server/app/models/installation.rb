class Installation < ApplicationRecord
  belongs_to :company
  belongs_to :customer
  has_many :panels

  validates :street, :city, :zipcode, :country, :installation_date, presence: true
end
