class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  # calcult du total
  def amount
    amount = 0
    self.cart_items.each do |cart_item|
      amount += cart_item.price
    end
    amount
  end
end
