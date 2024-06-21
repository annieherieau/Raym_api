class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :orders, through: :cart_items

  # calcult du total
  def amount
    amount = 0
    self.cart_items.each do |cart_item|
      amount += cart_item.price
    end
    amount
  end

  # Annulation de l'order: les items rebasculent dans le panier
  def cancel
    # transferer les cart_items sur l'order
    self.cart_items.each do |item|
      item.update(
        order_id: nil,
        cart_id: self.user.cart.id
      )
    end
  
  end

  def send_order_emails
    UserMailer.order_to_user(self).deliver_now
    UserMailer.order_to_admin(self).deliver_now
  end
end
