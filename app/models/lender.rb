class Lender < ApplicationRecord
  has_secure_password
  has_many :loans
  has_many :money_lent, through: :loans, source: :borrower

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*[0-9]).{8,}/

  before_save :downcase_fields
  before_create validates :password, allow_blank: true,  format: { with: PASSWORD_REGEX }

  validates :first_name, :last_name, :email, :money, presence: true

  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def downcase_fields
    self.email.downcase!
  end

end
