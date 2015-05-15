class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :plot
      t.string :type

      t.timestamps null: false
    end
  end
end
