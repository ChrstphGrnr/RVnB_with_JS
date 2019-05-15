class Rv < ApplicationRecord
    has_many :users, through: :trips
    belongs_to :owner, optional: true
end
