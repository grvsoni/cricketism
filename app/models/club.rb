class Club < ActiveRecord::Base
  belongs_to :level
  validates :name, :city, :state, :country, :presence => true

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/assets/club_logo.jpeg"
end
