class Borrower < ApplicationRecord
  has_secure_password
  has_many :loans
  has_many :money_received, through: :loans, source: :lender

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*[0-9]).{8,}/

  before_save :downcase_fields
  before_create validates :password, allow_blank: true,  format: { with: PASSWORD_REGEX }

  validates :first_name, :last_name, :email, :need_title, :need_descrip, :need_amt, :amt_raised, presence: true

  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  # def initialize first_name, last_name, email, need_title, need_descrip, need_amt, amt_raised
  #   @amt_raised = 0
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @need_title = need_title
  #   @need_descrip = need_descrip
  #   @need_amt = need_amt
  # end

  def downcase_fields
    self.email.downcase!
  end
end
