require 'csv'

class CoreBasedStatArea < ApplicationRecord
  has_many :population_stats

  def self.process_core_based_stat_areas_file(file)
    reset_tables
    CSV.foreach(file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      data = row.to_h
      cbsa_attr = data.keys[0]

      cbsa_record = CoreBasedStatArea.find_or_create_by!(
                                                          cbsa: data[cbsa_attr],
                                                          mdiv: data["MDIV"]
                                                        )

      PopulationStat.create!(
                              name: data["NAME"],
                              lsad: data["LSAD"],
                              pop_2014: data["POPESTIMATE2014"],
                              pop_2015: data["POPESTIMATE2015"],
                              core_based_stat_area_id: cbsa_record.id
                            )
    end
  end

  private

  def self.reset_tables
    CoreBasedStatArea.delete_all
    PopulationStat.delete_all
  end
end
