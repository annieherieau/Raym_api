# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }
  let!(:product) { create(:product, category: category) }

  describe 'associations' do
    it { should have_many(:products).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
