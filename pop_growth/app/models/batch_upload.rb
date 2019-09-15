
class BatchUpload < ApplicationRecord
  has_many :population_stats

  def self.get_active
    BatchUpload.where(active: true)
  end

  def uploading!
    self.status = "uploading"
  end

  def find_or_create_cbsa(data)
    CoreBasedStatArea.find_or_create_by(cbsa: data["CBSA"], mdiv: data["MDIV"])
  end

  # def process_population_data(file)
  #   active_batch_upload = BatchUpload.get_active
  #   active_batch_upload.uploading!
  #
  #   new_batch_upload = BatchUpload.create
  #
  #   CSV.foreach(file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
  #     data = row.to_h
  #     cbsa_record = find_or_create_cbsa(data)
  #     batch_upload_cbsa = UploadCBSA.create!(batch_upload_id: new_batch_upload.id, core_based_stat_area_id: cbsa_record.id) #what is UploadCBSA?
  #     Population.create(...)
  #   end
  #
  #   new_batch_upload.activate!
  # end
end
