class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10, message: "must be 10 digits" }
  validates :subject, presence: true
  validates :message, presence: true
  # validate :phone_number_format

  private

  def phone_number_format
    unless phone =~ /\A\+?\d{10,15}\z/
      errors.add(:phone, "must be a valid phone number (10-15 digits)")
    end
  end
end
