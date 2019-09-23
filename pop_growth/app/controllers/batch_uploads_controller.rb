class BatchUploadsController < ApplicationController
  def upload
    file_path = file.path
    ReportWorker.perform_async(file_path, type)
    render json: {data: "success"}
  rescue => e
    render json: {error: e.message }
  end

  private

  def file
    file = params[:file]
    raise "You must provide a file." if file.blank?
    file
  end

  def type
    type = params[:type]
    raise "You must provide a type." if type.blank?
    type
  end

end
