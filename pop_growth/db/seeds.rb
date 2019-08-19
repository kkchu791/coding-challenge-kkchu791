require 'csv'

# seeding Zip Table
# CSV.foreach('data/zip_to_cbsa.csv', headers: true) do |row|
#   zip_code = row.to_h
#   zip = zip_code.keys[0]
#   ZipCode.create!(
#     {
#       zip_code: zip_code[zip],
#       cbsa: zip_code["CBSA"]
#     }
#   )
# end


#seeding CBSA Table

# CoreBasedStatArea.destroy_all
# CSV.foreach('data/cbsa_to_msa.csv', headers: true, encoding:'iso-8859-1:utf-8') do |row|
#   cbsa = row.to_h
#   cbsa_attr = cbsa.keys[0]
#   record = CoreBasedStatArea.find_or_create_by(cbsa: cbsa[cbsa_attr], mdiv: cbsa["MDIV"])
# end


#seeding PopulationStat Table

#
# PopulationStat.destroy_all
# CSV.foreach('data/cbsa_to_msa.csv', headers: true, encoding:'iso-8859-1:utf-8') do |row|
#   pop = row.to_h
#   cbsa_attr = pop.keys[0]
#   PopulationStat.create(
#     {
#       name: pop["NAME"],
#       lsad: pop["LSAD"],
#       pop_2014: pop["POPESTIMATE2014"],
#       pop_2015: pop["POPESTIMATE2015"],
#       cbsa_id: pop[cbsa_attr]
#     }
#   )
# end
