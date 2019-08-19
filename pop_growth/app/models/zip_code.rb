class ZipCode < ApplicationRecord
  def self.process_zip_file(file)
    ZipCode.destroy_all
    CSV.foreach(file, headers: true) do |row|
      zip_code = row.to_h
      zip_attr = zip_code.keys[0]

      ZipCode.create!(
        {
          zip_code: zip_code[zip_attr],
          cbsa: zip_code["CBSA"]
        }
      )
    end
  end
end
