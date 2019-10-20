class CreateFoodsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :time_to_cook
      t.integer :energy
      t.text :ingredient
      t.text :recipe
      t.string :image
      t.boolean :is_premium

      t.timestamps
    end
  end
end
