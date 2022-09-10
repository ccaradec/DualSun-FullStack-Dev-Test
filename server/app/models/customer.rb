class Customer < ApplicationRecord
  validates :fname, :lname, :email, :phone, presence: true
  validates :phone, phone: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
