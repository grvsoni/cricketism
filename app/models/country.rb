class Country < ActiveRecord::Base
  has_many :profiles
  has_many :states
end
