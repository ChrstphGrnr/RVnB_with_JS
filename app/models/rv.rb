class Rv < ApplicationRecord
    has_many :users, through: :trips

    def self.highest_trip_count
        order("trip_count DESC").first
    end

    def self.order_by_price
        order("price ASC")
    end

    def total_price
        self.price*number_of_days        
    end 

    def number_of_days
        days = self.end_date - self.start_date
    end

    
end
