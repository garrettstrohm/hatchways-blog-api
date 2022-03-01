require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /api/posts" do
    it "throws error message without params" do
      get "/api/posts"
      expect(response).to have_http_status(:bad_request)
    end

    it "returns an array of objects" do
      get "/api/posts", params: {tags: ["science", "health"], sortBy: "likes", direction: "asc"}
      expect(response).to have_http_status(:ok)
    end

    it "throws error message with incorrect params" do
      get "/api/posts", params: {tags: ['science'], sortBy: "cheese", direction: "desc"}
      expect(response).to have_http_status(:bad_request)
    end

  end

end
