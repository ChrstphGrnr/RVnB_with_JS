class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :trips
  has_many :rvs, through: :trips 
end
