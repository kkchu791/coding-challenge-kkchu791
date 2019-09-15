class PopulationStat < ApplicationRecord
  belongs_to :core_based_stat_area
  has_many :population_estimates
end
