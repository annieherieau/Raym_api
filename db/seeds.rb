# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
Faker::Config.locale='fr'
Faker::UniqueGenerator.clear

# Supprimer toutes les données existantes
def reset_db
  User.destroy_all
  Cart.destroy_all
  Product.destroy_all
  Option.destroy_all

  # reset table sequence
  ActiveRecord::Base.connection.tables.each do |t|
    # postgreSql
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
    # SQLite
    # ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{t}'")
  end

  puts('drop and reset all tables')
end

def super_admin()
  User.create!(
  email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD'],
    admin: true
  )
  puts("super Admin créé - login 'DEFAULT_ADMIN' / mdp: '123456'")
end

def create_users(number)
  number.times do |i|
    User.create!(
      # email: Faker::Internet.unique.email,
      email: "user#{i+1}@az.az",
      password: '123456',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end
  puts("#{number} Users créés")
end

def create_products(number)
  number.times do |i|
    product = Product.create!(
      name: Faker::Beer.brand,
      description: Faker::Lorem.paragraph,
      price: Faker::Number.decimal(l_digits: 2)
    )
  end
  puts "#{number} Products créés"
end

def create_options(number)
  number.times do |i|
    Option.create!(
        name: Faker::Science.element,
        description: Faker::Lorem.paragraph,
        product: Product.all.sample
      )
  end

  puts "#{number} Options créées"
end
def create_variants(number)
  number.times do |i|
    Variant.create!(
      name: Faker::Color.color_name,
      description: Faker::Lorem.paragraph,
      option: Option.all.sample
    )
  end
  puts "#{number} Variants créés"
end

# PERFORM SEEDING
reset_db
super_admin()
create_users(2)
create_products(3)
create_options(5)
create_variants(10)