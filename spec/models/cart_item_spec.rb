# spec/models/cart_item_spec.rb

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:product) { create(:product) }
  let(:cart_item) { build(:cart_item) }
  let(:cart) { create(:cart) }
 

  describe 'associations' do
    it { should belong_to(:cart).optional }
    it { should belong_to(:product) }
    it { should belong_to(:order).optional }
  end

end
