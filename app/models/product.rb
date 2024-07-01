# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :cart_items
  has_one_attached :photo
  has_many :comments, dependent: :destroy
  belongs_to :color
  belongs_to :category

  def photo_url
    Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
  end
end
