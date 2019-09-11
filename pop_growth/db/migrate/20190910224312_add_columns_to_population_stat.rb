class AddColumnsToPopulationStat < ActiveRecord::Migration[5.2]
  def change
    add_column :population_stats, :batch_upload_id, :integer
  end
end
