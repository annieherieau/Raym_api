# spec/factories/categories.rb

FactoryBot.define do
    factory :category do
      name { Faker::Commerce.department }
      description { Faker::Lorem.paragraph }
    end
  end
  