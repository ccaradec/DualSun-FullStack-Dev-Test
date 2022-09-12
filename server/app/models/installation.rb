class Installation < ApplicationRecord
  belongs_to :company
  belongs_to :customer
  has_many :panels, dependent: :destroy

  validates :street, :city, :zipcode, :country, :installation_date, presence: true

  def as_json(*)
    super.except("company_id", "customer_id").tap do |h|
      h["company"] = company
      h["customer"] = customer
      h["panels"] = panels
    end
  end
end
