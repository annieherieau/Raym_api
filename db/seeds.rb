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
Faker::Config.locale = 'fr'
Faker::UniqueGenerator.clear
require_relative './data.rb'

# Supprimer toutes les données existantes
def reset_db
  User.destroy_all
  Cart.destroy_all
  CartItem.destroy_all
  Product.destroy_all
  Category.destroy_all
  Color.destroy_all
  Order.destroy_all
  Comment.destroy_all
  ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
  # reset table sequence
  ActiveRecord::Base.connection.tables.each do |t|
    # postgreSql
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
    # SQLite
    # ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{t}'")
  end

  puts('drop and reset all tables')
end

def boolean_ratio(percent = 50)
  ratio = percent.to_f / 100
  Faker::Boolean.boolean(true_ratio: ratio)
end

def super_admin
  User.create!(
    email: ENV['ADMIN_EMAIL'],
    password: ENV['ADMIN_PASSWORD'],
    admin: true
  )
  puts("super Admin créé - login 'DEFAULT_ADMIN' / mdp: '123456'")
end

def create_users(number)
  number.times do |i|
    user = User.create!(
      email: "user#{i + 1}@az.az",
      password: '123456',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
    create_cart_items(Faker::Number.between(from: 0, to: 4), user.cart)
  end
  puts("#{number} Users créés avec panier")
end

def create_colors
  COLORS.each do |color|
    Color.create!(
      name: color[:name],
      collection: color[:collection]
    )
  end
  puts("#{COLORS.length} Colors créées")
end

def create_categories
  CATEGORIES.each do |category|
    Category.create!(
      name: category[:name],
      configurator: category[:configurator] || false,
      bike: category[:bike] || false,
      clothing: category[:clothing] || false,
    )
  end
  puts("#{CATEGORIES.length} Categories créées")
end

def create_products
  PRODUCTS.each do |product|
    new_product = Product.create!(
      name: product[:name],
      description: Faker::Lorem.paragraph,
      price: product[:price],
      category: Category.find_by(name: product[:category]),
      color: Color.find_by(name: product[:color])
    )
    # photo
    new_product.photo.attach(io: File.open(PHOTO_PATH + product[:photo]), filename: product[:photo])
  end
  puts "#{PRODUCTS.length} Products créés"
end

def create_comments
  Product.all.each do |product|
    3.times do
      Comment.create!(
        user: User.all.sample,
        product: product,
        content: Faker::Lorem.sentence,
        rating: Faker::Number.between(from: 1, to: 5)
      )
    end
  end
  puts "Commentaires créés pour chaque produit"
end

def create_cart_items(number, cart)
  number.times do |i|
    CartItem.create!(
      cart: cart,
      product: Product.all.sample,
      quantity: Faker::Number.between(from: 1, to: 3)
    )
  end
  puts "#{number} Cart_items ajouté dans le panier"
end

def create_order_items(number, order)
  number.times do |i|
    CartItem.create!(
      order: order,
      product: Product.all.sample,
      quantity: Faker::Number.between(from: 1, to: 3)
    )
  end
  puts "#{number} Order_items ajouté dans l'ordre"
end

def create_orders(number)
  number.times do |i|
    order = Order.create!(
      user: User.all.sample,
      paid: boolean_ratio
    )
    create_order_items(Faker::Number.between(from: 1, to: 4), order)
  end
  puts "#{number} Orders créés"
end

# PERFORM SEEDING
reset_db
create_categories()
create_colors()
super_admin()
create_products()
create_users(5)
create_comments()
create_orders(5)
