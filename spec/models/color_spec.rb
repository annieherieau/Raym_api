# spec/models/color_spec.rb

require 'rails_helper'

RSpec.describe Color, type: :model do
  let(:color) { create(:color) }
  let!(:product) { create(:product, color: color) }

  describe 'associations' do
    it { should have_many(:products).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'dependent destroy' do
    it 'destroys associated products when color is destroyed' do
      expect { color.destroy }.to change { Product.count }.by(-1)
    end
  end
end
