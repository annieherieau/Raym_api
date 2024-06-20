class ItemVariant < ApplicationRecord
  belongs_to :variants
  belongs_to :cart_items
end
