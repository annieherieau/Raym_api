class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  # vider le panier
  def clear
    self.cart_items.delete_all
  end

  def validate

  end
end
