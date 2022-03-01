require 'rails_helper'

RSpec.describe "Pings", type: :request do
  describe "GET /api/ping" do
    it "sends status code of :ok" do
      get '/api/ping'
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq("{\"success\":true}")
    end
  end
end
