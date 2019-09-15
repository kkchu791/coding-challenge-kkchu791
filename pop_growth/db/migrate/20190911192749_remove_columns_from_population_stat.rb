class RemoveColumnsFromPopulationStat < ActiveRecord::Migration[5.2]
  def change
    remove_column :population_stats, :pop_2014, :integer
    remove_column :population_stats, :pop_2015, :integer
  end
end
