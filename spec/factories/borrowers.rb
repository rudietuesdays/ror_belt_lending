FactoryGirl.define do
  factory :borrower do
    first_name "Ash"
    last_name "Ketchem"
    email "ash@coder.com"
    password "password1"
    need_title "pokemon stadium"
    need_descrip "i want to be the very best like no one ever was. so i need to train, duh"
    need_amt 1000
  end
end
