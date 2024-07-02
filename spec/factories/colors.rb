# spec/factories/colors.rb

FactoryBot.define do
    factory :color do
      name { Faker::Color.color_name }
      collection { "Spring Collection" }
    end
  end
  