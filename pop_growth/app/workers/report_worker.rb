class ReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(file, type)
    CSVParser.new(file, type).process_file
  end
end

#maybe it has to do with the fact that is calling a model within a worker
