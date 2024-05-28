class CreateCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :carts, :products do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
