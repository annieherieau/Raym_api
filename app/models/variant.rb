class Variant < ApplicationRecord
  belongs_to :option
  # has_many :product_variants, dependent: :destroy
  # has_many :products, through: :product_variants
end
