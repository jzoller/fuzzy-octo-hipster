# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trade do
    trade_id 1
    counter_party "MyString"
    trader "MyString"
    mtm_curve "MyString"
    buy_sell "MyString"
    price "9.99"
    volume 1
    tenor_start "MyString"
    tenor_end "MyString"
    delivery_location "MyString"
    instrument "MyString"
    brokerage "MyString"
    tags "MyString"
    notes "MyString"
  end
end
