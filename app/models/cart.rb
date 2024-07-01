# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  # vider le panier
  def clear
    cart_items.delete_all
  end

  # valider le panier pour créer un order
  def validate
    # creer l'order
    @order = Order.create!(
      user:
    )
    # transferer les cart_items sur l'order
    cart_items.each do |item|
      item.update(
        order_id: @order.id,
        cart_id: nil
      )
    end
  end

  # calcult du total
  def amount
    amount = 0
    cart_items.each do |cart_item|
      amount += cart_item.price
    end
    amount
  end
end
