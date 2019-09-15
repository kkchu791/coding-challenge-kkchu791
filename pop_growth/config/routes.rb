Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get '/fetch_population_stats' => 'application#fetch_population_stats'
  post '/upload' => 'batch_uploads#upload'
end
