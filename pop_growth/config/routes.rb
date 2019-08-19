Rails.application.routes.draw do
  get '/get_pop' => 'application#get_pop'
  post '/upload_zip_codes' => 'zip_codes#upload_zip_codes'
  post '/upload_core_based_stat_areas' => 'core_based_stat_areas#upload_core_based_stat_areas'
end
