class Trip < ApplicationRecord
    belongs_to :rv 
    belongs_to :user

    def self.trips_by_user(user_id) 
        where(user_id: user_id)
    end

    def total_price
        self.rv.price.remove(/\D/).to_i*number_of_days        
    end 

    def number_of_days
        (self.end_date.to_datetime - self.start_date.to_datetime).to_i
    end


end
