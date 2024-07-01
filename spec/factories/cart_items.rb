# spec/factories/cart_items.rb

FactoryBot.define do
    factory :cart_item do
      association :cart
      association :product
      quantity { 1 }
      price { Faker::Commerce.price }
    end
  end
  