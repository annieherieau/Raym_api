# spec/factories/orders.rb

FactoryBot.define do
    factory :order do
      association :user
      paid { false }
    end
  end
  