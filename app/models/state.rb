class State < ActiveRecord::Base
  has_many :profiles
  belongs_to :country
  has_many :cities
end