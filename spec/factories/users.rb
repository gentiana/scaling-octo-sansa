# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Ala MaKota"
    email "ala@ma.kota"
    password 'qwerty'
    password_confirmation 'qwerty'
  end
end
