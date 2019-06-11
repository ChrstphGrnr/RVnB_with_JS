class Rv < ApplicationRecord
    has_many :trips
    has_many :users, through: :trips
    
    
    scope :highest_trip_count, -> {order("trip_count DESC").first}


    def self.order_by_price
        order("price ASC")
    end

    def available?(start_date, end_date)
        start_d = start_date.to_datetime
        end_d = end_date.to_datetime
        self.trips.each do |trip|
            if (start_d > trip.start_date && start_d < trip.end_date) 
                return false
            end
        end
    end
    
end
