require 'rails_helper'
feature 'Lender features' do
  feature "Lender Settings Dashboard" do
    before(:each) do
      @lender = create(:lender)
      log_in
      visit "/lenders/#{@lender.id}/edit"
    end

    scenario "destroys lender and redirects to registration page" do
      click_button "Delete User"
      expect(current_path).to eq('/lenders/new')
    end
  end
end
