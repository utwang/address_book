# coding: utf-8

FactoryGirl.define do
  factory :address do
    first_name "一郎"
    last_name "田中"
    email "ichiro_t@example.co.jp"
    organization "日本"
    country "日本"
    street_address1 "渋谷1丁目"
    street_address2 "シブヤビル21F"
    city "渋谷区"
    prefecture "東京都"
    postal_code "123-0012"
    phone "03-1001-1001"
  end
end
