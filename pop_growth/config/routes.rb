Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get '/fetch_population_stats' => 'population_stats#fetch_population_stats'
  post '/upload' => 'batch_uploads#upload'
end
