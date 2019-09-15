class BatchUploadsController < ApplicationController
  def upload
    file = params[:file].path
    type = params[:type]
    ReportWorker.perform_async(file, type)
  end
end
