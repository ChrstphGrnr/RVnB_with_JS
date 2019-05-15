class Rv < ApplicationRecord
    has_many :users, through: :trips
end
