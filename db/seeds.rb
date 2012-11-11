# coding: utf-8

AddressList.delete_all
Address.delete_all

3.times do |n|
  AddressList.create(title: "アドレス帳#{n}", description: "#{n}番目のアドレス帳")
end

AddressList.all.each do |address_list|
  10.times do |n|
    first_name = Faker::Japanese::Name.first_name
    last_name = Faker::Japanese::Name.last_name
    email = "sample-#{address_list.id}#{n}@example.com"

    address_list.addresses << Address.create(first_name: first_name, last_name: last_name, email: email)
  end
end
