# spec/models/product_spec.rb

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  describe 'associations' do
    it { should belong_to(:color) }
    it { should belong_to(:category)}
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:cart_items).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end
end
