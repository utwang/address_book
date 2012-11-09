# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_list_id 1
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    organization "MyString"
    country "MyString"
    street_address1 "MyText"
    street_address2 "MyText"
    city "MyString"
    prefecture "MyString"
    postal_code "MyString"
    phone "MyString"
  end
end
