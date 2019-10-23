class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :user_image, default: ''
      t.boolean :is_premium, default: false
      t.datetime :premium_time

      t.timestamps
    end
  end
end
