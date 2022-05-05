class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found_msg

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer, status: :ok
    end
    def create
       camper = Camper.create!(camper_params)
       render json: camper, status: 201
    end

    private
    def camper_params
        params.permit(:name,:age)
    end

    def camper_not_found_msg(invalid)
            # byebug
            render json: {error: "Camper not found"}, status: 404
    end
end
