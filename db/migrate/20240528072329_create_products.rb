class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category #cheese, ham,...
      t.string :subtitle
      t.text :description
      t.float :price
      t.timestamps
    end
  end
end
