class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid

    def rescue_from_record_invalid invalid
        render json: { errors: invalid.record.errors.full_messages}, status: :bad_request
    end

end
