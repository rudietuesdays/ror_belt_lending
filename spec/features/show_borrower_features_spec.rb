require 'rails_helper'
feature 'borrower features' do
  before(:each) do
    @borrower = create(:borrower)
    log_in
  end
  scenario 'show borrow route contains correct information' do
    expect(current_path).to eq("/borrowers/#{@borrower.id}")
  end
end
