# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true
  has_many :item_variants
  has_many :variants, through: :item_variants

  before_create :update_price
  before_update :update_price

  def update_price
    self.price = quantity * product.price
  end
end
