class ChangeCartItemReferences < ActiveRecord::Migration[7.1]
  def change
    # remove_reference :cart_items, :cart, foreign_key: true, index: false
    # add_reference :cart_items, :cart, foreign_key: true, optional: :true
    change_column_null :cart_items, :cart_id, true
    add_reference :cart_items, :orders, index: true
    add_column :cart_items, :price, :decimal
  end
end
