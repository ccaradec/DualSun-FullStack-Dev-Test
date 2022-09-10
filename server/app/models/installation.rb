class Installation < ApplicationRecord
  belongs_to :company
  belongs_to :customer

  validates :street, :city, :zipcode, :country, :installation_date, presence: true
end
