class Option < ApplicationRecord
  has_many :variants, dependent: :destroy
  belongs_to :product

  after_create :create_default_variant

  def create_default_variant
    Variant.create!(
      name: 'default',
      default: true,
      option: self
    )
  end
end
