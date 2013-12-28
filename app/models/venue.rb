class Venue < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :uniqueness => true, :presence => true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
