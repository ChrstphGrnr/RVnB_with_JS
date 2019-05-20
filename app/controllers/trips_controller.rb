class TripsController < ApplicationController
   
    def new
        if user_signed_in? && params[:rv_id]
            @trip = Trip.new(rv_id: params[:rv_id], user_id: current_user.id)
        else 
            redirect_to new_user_session_path, alert: "Please login before creating a new Trip"
        end
                
    end

    def create
        @trip = Trip.new(trip_params)
        if @trip.save 
            rv = Rv.find_by(id: @trip.rv_id)
            rv.trip_count += 1 
            rv.save
            redirect_to user_trip_path(current_user.id, @trip)
        else
            render 'trips/new', alert: "Invalid Data, please try again."
        end
    end
    

    def show 
        @trip = Trip.find(params[:id])
    end

    def index
        if !user_signed_in? 
            redirect_to new_user_session_path, alert: "Please SignIn to see your trips or to create new Trips!"
        elsif user_signed_in? && params[:rv_id]
           rv = Rv.find(params[:rv_id])
           @trips = rv.trips
        elsif user_signed_in?
            @trips = Trip.trips_by_user(current_user.id)
        else 
            redirect_to '', alert: "You do not have permission to view this page!"
        end
    end

    def edit 
        @trip = Trip.find(params[:id])
        if user_signed_in? && @trip.user_id == current_user.id
            @trip
        else 
            redirect_to '', alert: "You don't have permission to edit this trip."
        end 
    end

    def update 
        @trip = Trip.find(params[:id])
        if @trip.update(trip_params)
            redirect_to user_trip_path(current_user.id, @trip.id)
        else 
            render 'edit'
        end
    end

    def destroy
        Trip.find(params[:id]).destroy
        redirect_to user_trips_path(current_user.id)
    end

    private 

        def trip_params
            params.require(:trip).permit(:name, :start_date, :end_date, :guests, :user_id, :rv_id)
        end
end
