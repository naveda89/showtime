class AddSlugToContent < ActiveRecord::Migration
  def change
    add_column :contents, :slug, :string, null: false
    add_index :contents, :slug, unique: true
  end
end
