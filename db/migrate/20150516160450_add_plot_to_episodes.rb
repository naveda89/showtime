class AddPlotToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :plot, :text, default: ''
  end
end
