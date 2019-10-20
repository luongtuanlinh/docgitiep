class CreateRecipesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
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
