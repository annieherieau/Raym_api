# frozen_string_literal: true

class Color < ApplicationRecord
  has_many :products, dependent: :destroy
end
