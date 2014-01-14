class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :club
  belongs_to :profile

  validates :skill, :batting_hand, :bowling_hand, :presence => true
end
