class Product < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_one_attached :photo
    has_many :options
    # has_many :product_variants, dependent: :destroy
    # has_many :variants, through: :product_variants
    has_many :comments, dependent: :destroy

    def photo_url
        Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
      end

end
