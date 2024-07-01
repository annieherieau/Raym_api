# frozen_string_literal: true

class AddConfiguratorToCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :configurator, :boolean, default: false
    add_column :categories, :bike, :boolean, default: false
    add_column :categories, :clothing, :boolean, default: false
  end
end
