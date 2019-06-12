class RvSerializer < ActiveModel::Serializer
  attributes :id, :name, :sleeps, :price, :trip_count
  has_many :trips
  has_many :users, through: :trips
end
