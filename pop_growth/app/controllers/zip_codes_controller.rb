class ZipCodesController < ApplicationController
  require 'csv'
  
  def upload_zip_codes
    file = params[:file].tempfile
    ZipCode.process_zip_file(file)
    puts "Done!"
  end
end
