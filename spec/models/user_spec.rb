# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_one(:cart).dependent(:destroy) }
    it { should have_many(:orders).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
