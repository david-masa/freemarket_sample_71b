class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :family_name,             null: false
      t.string     :first_name,              null: false
      t.string     :family_name_kana,        null: false
      t.string     :first_name_kana,         null: false
      t.string     :postal_code,             null: false
      t.integer     :city,                    null: false, default: 0
      t.string     :local,                   null: false
      t.string     :block,                   null: false
      t.string     :building
      t.string     :number
      t.references :user,                    null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
