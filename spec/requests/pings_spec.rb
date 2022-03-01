require 'rails_helper'

RSpec.describe "Pings", type: :request do
  describe "GET /api/ping" do
    it "sends status code of :ok" do
      get '/api/ping'
      parsed_body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(parsed_body).to include_json({
        success: true
      })
    end
  end
end
