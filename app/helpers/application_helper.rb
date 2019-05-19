module ApplicationHelper

    def most_popular
        Rv.highest_trip_count
    end
    
    def all_rvs 
        Rv.all 
    end
end
