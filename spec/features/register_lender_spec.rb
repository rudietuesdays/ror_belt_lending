require 'rails_helper'
feature 'lender features' do

  feature "lender sign-up" do
    scenario 'visits sign-up page' do
      visit '/register'
      expect(page).to have_content "Lender"
    end
    scenario "with proper inputs, create lender and redirects to lender show page" do
      register
      expect(current_path).to eq("/lenders/1")
      expect(page).to have_content "Lender successfully created!"
    end
  end

  feature "with invalid inputs, redirects back to sign in and shows validations" do
    scenario "because first name is blank" do
      register first_name: ''
      expect(current_path).to eq('/register')
      expect(page).to have_content "First name can't be blank"
    end
    scenario "because last name is blank" do
      register last_name: ''
      expect(current_path).to eq('/register')
      expect(page).to have_content "Last name can't be blank"
    end
    scenario "because email is blank" do
      register email: ''
      expect(current_path).to eq('/register')
      expect(page).to have_content "Email can't be blank"
    end
    scenario "because email not in correct format" do
      register email: 'abc123.com'
      expect(current_path).to eq('/register')
      expect(page).to have_content "Email is invalid"
    end
    scenario "because password field is blank" do
      register password: ''
      expect(current_path).to eq('/register')
      expect(page).to have_content "Password can't be blank"
    end
    scenario "because password is too short" do
      register password: 'pass1'
      expect(current_path).to eq('/register')
      expect(page).to have_content "Password is invalid"
    end
    scenario "because password does not contain a number" do
      register password: 'password'
      expect(current_path).to eq('/register')
      expect(page).to have_content "Password is invalid"
    end
  end

end
