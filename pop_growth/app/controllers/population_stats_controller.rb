class PopulationStatsController < ApplicationController
  def fetch_population_stats
    zip_code = zip_code_params[:zip_code]
    raise "You must enter a zip code." if zip_code.blank?
    retriever = PopulationStatRetriever.new(zip_code)
    population_stat = retriever.search
    render json: {data: population_stat}
  rescue => e
    render json: {error: e.message }
  end

  private

  def zip_code_params
    params.permit(:zip_code)
  end
end
