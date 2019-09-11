class BatchUploadsController < ApplicationController

  def upload_zip_code_data
    file = params[:file].tempfile
    process_zip_code_data(file)
  end

  def upload_population_data
    file = params[:file].tempfile
    process_population_data(file)
  end
end
