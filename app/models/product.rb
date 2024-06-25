class Product < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :orders, through: :cart_items
    has_one_attached :photo
    has_many :comments, dependent: :destroy
    has_many :color_products
    has_many :colors, through: :color_products
    has_many :category_products
    has_many :categories, through: :category_products


    def photo_url
        Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
    end

end
