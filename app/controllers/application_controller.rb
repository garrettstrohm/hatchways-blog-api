class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid

end
