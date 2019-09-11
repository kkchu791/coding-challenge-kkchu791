class CoreBasedStatAreasController < ApplicationController  
  def upload_core_based_stat_areas
    file = params[:file].tempfile
    CoreBasedStatArea.process_core_based_stat_areas_file(file)
    puts "Done!"
  end
end
