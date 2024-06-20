class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :options do |t|
      t.string :name, null: false
      t.text :description, :default => ""
      t.belongs_to :product, index:true, null: false
      t.timestamps
    end
  end
end
