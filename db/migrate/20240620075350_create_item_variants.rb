class CreateItemVariants < ActiveRecord::Migration[7.1]
  def change
    create_table :item_variants do |t|
      t.belongs_to :variants, index: true, null: false
      t.belongs_to :cart_items, index: true, null: false
      t.timestamps
    end
  end
end
