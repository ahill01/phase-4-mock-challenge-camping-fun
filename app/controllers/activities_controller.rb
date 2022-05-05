class ActivitiesController < ApplicationController

    def index
        render json: Activity.all, status: :ok
    end

    def destroy
       deleted = Activity.find(params[:id])
       deleted.destroy
       render json: deleted, status: :ok
    end

end
