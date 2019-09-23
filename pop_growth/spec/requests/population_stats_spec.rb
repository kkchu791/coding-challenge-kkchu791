require 'rails_helper'

describe "population_stats", type: :request do

  describe "GET /fetch_population_stats" do
    it "should have an endpoint" do
      get '/fetch_population_stats', {params: {zip_code: "32003"}}
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end

    context "when given a matching zip code" do
      it "should return correct population stat data" do
        json = JSON.parse(response.body)
        data = {}
        expect(json["data"]).to eq(data)
      end
    end

    context "when zip code param is blank" do
      it "should return an error" do
        get '/fetch_population_stats', {params: {zip_code: ""}}
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("You must enter a zip code.")
      end
    end
  end
end
