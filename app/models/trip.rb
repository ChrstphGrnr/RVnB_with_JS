class Trip < ApplicationRecord
    belongs_to :rv 
    belongs_to :user
end
