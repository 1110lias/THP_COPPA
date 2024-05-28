class CreateCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :carts, :products do |t|
      t.float :quantity

      t.timestamps
    end
  end
end
