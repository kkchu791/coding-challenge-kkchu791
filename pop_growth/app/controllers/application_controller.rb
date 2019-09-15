class ApplicationController < ActionController::API

  def fetch_population_stats
    zip_code = zip_code_params[:zip_code]
    retriever = PopulationStatRetriever.new(zip_code)
    population_stat = retriever.search

    render json: population_stat
  end

  private

  def zip_code_params
    params.permit(:zip_code)
  end
end
