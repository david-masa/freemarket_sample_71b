class AdddayTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :day, :integer
  end
end
