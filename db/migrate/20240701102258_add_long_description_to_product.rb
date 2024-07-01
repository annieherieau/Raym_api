class AddLongDescriptionToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :long_description, :text, :default => ''
  end
end
