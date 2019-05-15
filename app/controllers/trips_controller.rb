class TripsController < ApplicationController

    def new
        if user_signed_in? && params[:rv_id]
            @trip = Trip.new(rv_id: params[:rv_id], user_id: current_user.id)
        else 
            redirect_to new_user_session_path, alert: "Please login before creating a new Trip"
        end
                
    end

    def create
        # byebug
        @trip = Trip.new(trip_params)
        if @trip.save 
            redirect_to trip_path(@trip)
        else
            render 'trips/new', alert: "Invalid Data, please try again."
        end
    end
    

    def show 
        @trip = Trip.find(params[:id])
    end

    def index
    end

    def edit 
    end

    def destroy
    end

    private 

        def trip_params
            params.require(:trip).permit(:name, :start_date, :end_date, :guests, :user_id, :rv_id)
        end
end
