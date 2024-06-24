class Product < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :orders, through: :cart_items
    has_one_attached :photo
    has_many :options
    has_many :comments, dependent: :destroy
    has_many :color_products
    has_many :colors, through: :color_products
    belongs_to :category

    enum category: [:velos, :gourdes, :casque, :tenues]

    def photo_url
        Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
    end

end
