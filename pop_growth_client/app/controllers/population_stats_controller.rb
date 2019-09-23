class PopulationStatsController < ApplicationController
  before_action :set_population_stat
  require 'httparty'

  def index
  end

  def upload
    file = params[:file]
    raise "You must upload a file first" if file.nil?
    file_name = file.original_filename
    HTTParty.post('http://localhost:3001/upload', body: {type: params[:type], file: params[:file]})
    flash.now[:notice] = "Uploading #{file_name}. Please wait a few minutes for the data to update"
    render action: "index"
  rescue => e
    flash.now[:error] = e.message
    render action: "index"
  end

  def fetch_population_stats
    zip_code = params[:zip_code]
    response = HTTParty.get("http://localhost:3001/fetch_population_stats?zip_code=#{zip_code}")
    json = JSON.parse(response.body)
    if json["error"].present?
      flash.now[:error] = json["error"]
    else
      @population_stat = json["data"]
    end
    render action: "index"
  end

  private

  def set_population_stat
    @population_stat = {
      "zip_code": "",
      "cbsa": "",
      "mda": "",
      "pop_2015": "",
      "pop_2014": "",
    }
  end
end
