# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    admin { false }

    factory :admin do
      admin { true }
    end
  end
end
