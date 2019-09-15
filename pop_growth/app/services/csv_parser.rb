require 'csv'

class CSVParser
  attr_reader :file, :type
  def initialize(file, type)
    @file = file
    @type = type
  end

  def process_file
    if type == "zip_codes"
      process_zip_codes
    else
      process_core_based_stat_areas_file
    end
  end

  def process_zip_codes
    CSV.foreach(file, headers: true) do |row|
      zip_code = row.to_h
      zip_attr = zip_code.keys[0]

      ZipCode.find_or_create_by!(
        zip_code: zip_code[zip_attr],
        cbsa: zip_code["CBSA"]
      )
    end
  end

  def process_core_based_stat_areas_file
    CSV.foreach(file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      data = row.to_h
      cbsa_attr = data.keys[0]
      cbsa_record = create_cbsa_record(data, cbsa_attr)
      population_stat_record = create_population_stat_record(data, cbsa_record)
      create_population_estimate_records(data, population_stat_record)
    end

    puts "CBSA process is finished"
  end

  private

  def create_cbsa_record(data, cbsa_attr)
    CoreBasedStatArea.find_or_create_by!(
                                           cbsa: data[cbsa_attr],
                                           mdiv: data["MDIV"]
                                         )
  end

  def create_population_stat_record(data, cbsa_record)
    PopulationStat.find_or_create_by!(
                                        name: data["NAME"],
                                        lsad: data["LSAD"],
                                        core_based_stat_area_id: cbsa_record.id
                                      )
  end

  def create_population_estimate_records(data, population_stat_record)
    #year 2014
    unless data["POPESTIMATE2014"].nil?
      PopulationEstimate.find_or_create_by!(year: 2014, estimate: data["POPESTIMATE2014"].to_i, population_stat_id: population_stat_record.id)
    end
    #year 2015
    unless data["POPESTIMATE2015"].nil?
      PopulationEstimate.find_or_create_by!(year: 2015, estimate: data["POPESTIMATE2015"].to_i, population_stat_id: population_stat_record.id)
    end
  end
end
