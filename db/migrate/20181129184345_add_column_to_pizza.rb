class AddColumnToPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :pizzas, :restaurant_id, :integer
  end
end
