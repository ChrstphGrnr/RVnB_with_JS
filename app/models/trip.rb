class Trip < ApplicationRecord
    belongs_to :rv 
    belongs_to :user

    def self.trips_by_user(user_id) 
        where(user_id: user_id)
    end
end
