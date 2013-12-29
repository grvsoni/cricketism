class Team < ActiveRecord::Base
  belongs_to :club
  belongs_to :user

  validates :name, :club, :presence => true
end
