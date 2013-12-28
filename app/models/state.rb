class State < ActiveRecord::Base
  has_many :profiles
  belongs_to :country
  has_many :cities
  belongs_to :user

  validates :name, :uniqueness => true, :presence => true
end