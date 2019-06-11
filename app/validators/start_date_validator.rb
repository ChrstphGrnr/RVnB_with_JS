class StartDateValidator < ActiveModel::Validator
    
    def validate(trip)
        # byebug
        if trip.end_date.empty? || trip.start_date.empty?
            trip.errors[:warning] << "You need to enter a start and end date for your trip"
        elsif start_date_smaller_than_end_date?(trip.start_date, trip.end_date) 
            trip.errors[:warning] << "You need to pick an end date that is after the start date"          
        end
    end
    

    def start_date_smaller_than_end_date?(start_date, end_date) 
        (end_date.to_datetime - start_date.to_datetime).to_i < 0 
    end

end
