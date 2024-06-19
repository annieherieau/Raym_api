class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  # vider le panier
  def clear
    
  end

  def validate

  end
end
