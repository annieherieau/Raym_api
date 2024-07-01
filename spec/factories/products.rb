# spec/factories/products.rb

FactoryBot.define do
    factory :product do
      name { Faker::Commerce.product_name }
      description { Faker::Lorem.sentence }
      price { Faker::Commerce.price }
      association :color
      association :category
    end
  end
  