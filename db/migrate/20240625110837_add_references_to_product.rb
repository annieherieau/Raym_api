# frozen_string_literal: true

class AddReferencesToProduct < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :color, foreign_key: true
    add_reference :products, :category, foreign_key: true
  end
end
