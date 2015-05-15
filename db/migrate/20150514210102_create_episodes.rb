class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :season
      t.integer :num

      t.timestamps null: false
    end
  end
end
