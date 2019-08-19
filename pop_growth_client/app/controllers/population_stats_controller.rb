class PopulationStatsController < ApplicationController
  require 'httparty'

  def index
    @population_stat = {
      zip_code: "32003",
      cbsa: "27260",
      mda: "Jacksonville, FL",
      pop_2015: "1,449,481",
      pop_2014: "1,421,004",
    }
  end
end
