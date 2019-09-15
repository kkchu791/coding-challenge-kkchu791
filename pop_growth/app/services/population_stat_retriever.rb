class PopulationStatRetriever
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def search
    cbsa_num = zip_code_record.cbsa
    core_based_stat_area_record = find_core_based_stat_area_record(cbsa_num)
    population_stat_record = find_population_stat_record(core_based_stat_area_record)
    pop_2014 = population_stat_record.population_estimates.where(year: 2014).first.estimate
    pop_2015 = population_stat_record.population_estimates.where(year: 2015).first.estimate

    population_stat = {
      zip_code: zip_code,
      cbsa: cbsa_num,
      msa: population_stat_record.name,
      pop_2014: pop_2014,
      pop_2015: pop_2015,
    }

    population_stat
  end

  private

  def zip_code_record
    ZipCode.find_by(zip_code: zip_code)
  end

  def find_core_based_stat_area_record(cbsa_num)
    core_based_stat_area_record = CoreBasedStatArea.find_by(cbsa: cbsa_num)

    if core_based_stat_area_record.nil?
      core_based_stat_area_record = CoreBasedStatArea.find_by(mdiv: cbsa_num)
    end

    core_based_stat_area_record
  end

  def find_population_stat_record(core_based_stat_area_record)
    population_stats = core_based_stat_area_record.population_stats
    population_stats.where(lsad: "Metropolitan Statistical Area").first
  end
end
