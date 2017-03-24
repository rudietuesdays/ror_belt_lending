require "rails_helper"
  module CapybaraHelpers
    def log_in email: "jane@coder.com", password: "password"
      visit '/login' unless current_path == "/login"
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Log In'
    end

    def register first_name: "Jane", last_name: "Doe", email: "jane@coder.com", password: "password1"
      visit '/register' unless current_path == '/register'
      fill_in 'lender[first_name]', with: first_name
      fill_in 'lender[last_name]', with: last_name
      fill_in 'lender[email]', with: email
      fill_in 'lender[password]', with: password
      click_button 'Register as a Lender'
    end
  end
