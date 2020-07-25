class AddyearTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :year, :integer
  end
end
