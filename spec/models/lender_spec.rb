require 'rails_helper'

RSpec.describe Lender, type: :model do
  context "with valid attributes" do
    it "should save" do
      expect(build(:lender)).to be_valid
    end
    it 'automatically encrypts the password into the password_digest attribute' do
      expect(build(:lender).password_digest.present?).to eq(true)
    end
    it 'email as lowercase' do
      expect(create(:lender, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')
    end
  end

  context "with invalid attributes should not save if" do
    it 'first name is blank' do
      expect(build(:lender, first_name: '')).to be_invalid
    end
    it 'last name is blank' do
      expect(build(:lender, last_name: '')).to be_invalid
    end
    it 'email is blank' do
      expect(build(:lender, email: '')).to be_invalid
    end
    it 'email format is wrong' do
      emails = %w[@ lender@ @example.com]
      emails.each do |email|
        expect(build(:lender, email: email)).to be_invalid
      end
    end
    it 'email is not unique' do
      create(:lender)
      expect(build(:lender)).to be_invalid
    end
    it 'password is blank' do
      expect(build(:lender, password: '')).to be_invalid
    end
    it 'password is less than 8 characters' do
      expect(build(:lender, password: 'pass1')).to be_invalid
    end
    it 'password does not contain a number' do
      expect(build(:lender, password: 'password')).to be_invalid
    end
    it "password doesn't match password_confirmation" do
      expect(build(:lender, password_confirmation: 'notpassword')).to be_invalid
    end
  end
end
