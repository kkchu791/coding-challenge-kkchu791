class AddColumnsToPopulationEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :population_estimates, :population_stat_id, :integer
  end
end
