class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.integer :category_id
      t.string :brand
      t.integer :condition_id, null: false
      t.integer :shipping_cost, null: false
      t.integer :shipping_days, null: false
      t.integer :costomer

      # t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end