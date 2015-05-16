class CreateContentPurchaseOptions < ActiveRecord::Migration
  def change
    create_table :content_purchase_options do |t|
      t.references :content
      t.references :purchase_option, index: true, foreign_key: true
      t.boolean :active, default: false
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
