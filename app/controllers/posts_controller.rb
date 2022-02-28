class PostsController < ApplicationController
    require 'rest-client'

    def show
        if (["id", "reads", "likes", "popularity"].include?(params['sortBy']) == false)

            render json: {error: "sortBy parameter is invalid"}, status: :bad_request
            
        elsif(['asc', 'desc'].include?(params['direction']) == false)

            render json: {error: "direction parameter is invalid"}, status: :bad_request

        elsif params["tags"]

            if params['sortBy'] == nil
                params['sortBy'] = 'id'
            end

            if params['direction'] == nil
                params['direction'] = 'asc'
            end

        threads = []
        responses = []

        for index in params["tags"]
            sortBy = params["sortBy"]
            direction = params["direction"]
            threads << Thread.new(index) { |tag|
                url = "https://api.hatchways.io/assessment/blog/posts?tag=#{tag}&sortBy=#{sortBy}&direction=#{direction}"
                response = RestClient.get(url)
                res_data = JSON.parse(response.body)
                responses << res_data["posts"]
            }
        end
            threads.each { |thread| thread.join}
            flattened = responses.flatten
            
        if params['direction'] == 'desc'
            sorted = flattened.sort_by{|obj| obj[params['sortBy']] }.reverse
        else
            sorted = flattened.sort_by{|obj| obj[params['sortBy']]}
        end
            render json: sorted, status: :ok
        else
            render json: {error: "Tags parameter is required"}, status: :bad_request
        end
    end

end
