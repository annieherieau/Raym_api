# spec/models/cart_spec.rb

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { create(:cart) }
  let!(:cart_item) { create(:cart_item, cart: cart) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:cart_items).dependent(:destroy) }
  end
end
