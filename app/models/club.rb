class Club < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :teams
  validates :name, :city, :state, :country, :presence => true
  validates :name, :uniqueness => true

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/assets/club_logo.jpeg"
end
