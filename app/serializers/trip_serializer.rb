class TripSerializer < ActiveModel::Serializer
  attributes :id, :guests, :name, :start_date, :end_date, :rv_id, :user_id
  belongs_to :rv
  belongs_to :user
end
