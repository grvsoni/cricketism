class City < ActiveRecord::Base
  has_many :profiles
  belongs_to :state
  belongs_to :user

  validates :name, :uniqueness => true, :presence => true
end