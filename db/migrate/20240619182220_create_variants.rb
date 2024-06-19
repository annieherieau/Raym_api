class CreateVariants < ActiveRecord::Migration[7.1]
  def change
    create_table :variants do |t|
      t.string :name, null: false
      t.text :description, :default => ""
      t.boolean :default, :default => false
      t.belongs_to :option, index: true, null: false
      t.timestamps
    end
  end
end
