require 'rails_helper'

describe "batch_uploads", type: :request do
  describe "POST /upload" do
    it "should have an endpoint" do
      post '/upload', params: { "file": {"path": "../test.csv"}, "type": "zip_codes" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json["data"]).to eq("success")
    end

    it "should have return a success message" do
      post '/upload', { "file": {"path": "../test.csv"}, "type": "zip_codes" }
      json = JSON.parse(response.body)
      expect(json["data"]).to eq("success")
    end

    context "when params are missing" do
      it "should return an error" do
        post '/upload', {"params": { "file": {"path": "test.csv"} }}
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("success")
      end
    end
  end
end
