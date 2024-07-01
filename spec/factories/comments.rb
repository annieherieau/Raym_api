# spec/factories/comments.rb

FactoryBot.define do
    factory :comment do
      association :user
      association :product
      content { Faker::Lorem.sentence }
      rating { rand(1..5) }
    end
  end
  