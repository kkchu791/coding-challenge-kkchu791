class RenameCbsaIdColumnToCoreBasedStatAreaId < ActiveRecord::Migration[5.2]
  def change
    rename_column :population_stats, :cbsa_id, :core_based_stat_area_id
  end
end
