class ReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(file, type)
    CSVParser.new(file, type).process_file
  end
end
