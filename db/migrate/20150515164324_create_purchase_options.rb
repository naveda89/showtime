class CreatePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :purchase_options do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :quality

      t.timestamps null: false
    end
  end
end
