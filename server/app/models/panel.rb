class Panel < ApplicationRecord
  belongs_to :installation
  enum panel_type: { photovoltaic: 0, hybrid: 1 }

  validates :panel_id, format: { with: /\d{6}/, message: "only allows exactly 6 digits" }
  validates :panel_type, presence: true
end
