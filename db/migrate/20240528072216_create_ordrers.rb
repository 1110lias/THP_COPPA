class CreateOrdrers < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :bundle_order_id #Future migration
      t.datetime :bundle_order_time #Future migration
      t.string :status
      t.datetime :startedate
      t.float :total_price, null: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
