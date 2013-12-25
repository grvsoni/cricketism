class City < ActiveRecord::Base
  has_many :profiles
  belongs_to :state
end