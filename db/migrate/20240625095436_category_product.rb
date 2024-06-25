class CategoryProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :category_products do |t|
    t.references :category, null: false, foreign_key: true
    t.references :product, null: false, foreign_key: true
    end
  end
end
