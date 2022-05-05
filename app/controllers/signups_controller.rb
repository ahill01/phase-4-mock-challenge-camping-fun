class SignupsController < ApplicationController
    def create
        new_signup = Signup.create!(signup_params)
        render json: new_signup.activity, status: 201
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
