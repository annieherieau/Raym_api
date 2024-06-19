class Product < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_one_attached :photo

    def photo_url
        Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
      end

end
