class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_msg
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_msg

  private
  def record_not_found_msg(invalid)
    # byebug
  render json: {error: "Activity not found"}, status: 404
  end

  def record_invalid_msg(invalid)
    # byebug
    render json: {errors: invalid.record.errors.full_messages}, status: 422
  end
end
