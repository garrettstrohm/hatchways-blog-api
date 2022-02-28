class PostsController < ApplicationController
    require 'rest-client'

    def show
        if params["tags"]
        threads = []
        responses = []
        for index in params["tags"]
            threads << Thread.new(index) { |tag|
                url = "https://api.hatchways.io/assessment/blog/posts?tag=#{tag}"
                response = RestClient.get(url)
                res_data = JSON.parse(response.body)
                responses << res_data
            }
        end
       threads.each { |thread| thread.join}
       render json: responses, status: :ok
    else
        render json: {error: "Tags parameter is required"}, status: :bad_request
    end

end
