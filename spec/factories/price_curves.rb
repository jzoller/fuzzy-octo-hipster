# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :price_curf, :class => 'PriceCurve' do
    curve_name "MyString"
    month "MyString"
    open "9.99"
    high "9.99"
    low "9.99"
    settle "9.99"
    change "9.99"
    bwave "9.99"
    vol 1
    efp 1
    efs 1
    block 1
    prev_vol 1
    prev_open 1
  end
end
