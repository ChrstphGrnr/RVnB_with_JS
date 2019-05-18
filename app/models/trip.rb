class Trip < ApplicationRecord
    belongs_to :rv 
    belongs_to :user

    validates :name, :guests, presence: :true 
    validates_with StartDateValidator, on: [:create, :edit, :update]
    # validates_with StartDateValidator, on: :update
    # validates_with StartDateValidator, on: :edit 
    

    def self.trips_by_user(user_id) 
        where(user_id: user_id)
    end

    def total_price
        if self.end_date && self.start_date
            "$ #{self.rv.price.remove(/\D/).to_i*number_of_days}"   
        else 
            "Please specify a start and end date for your trip to calculate a price!"
        end     
    end 

    def number_of_days
        if self.end_date
            (self.end_date.to_datetime - self.start_date.to_datetime).to_i
        else
            0
        end
    end

   

end
