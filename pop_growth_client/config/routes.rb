Rails.application.routes.draw do
   root 'population_stats#index'
   post '/upload' => 'population_stats#upload'
   get '/fetch_population_stats' => 'population_stats#fetch_population_stats'
end
