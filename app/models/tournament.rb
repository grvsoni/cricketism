class Tournament < ActiveRecord::Base
  belongs_to :match_type
  belongs_to :level
  belongs_to :venue
  has_and_belongs_to_many :sponsors
  belongs_to :user

  validates_presence_of :name, :match_type_id, :level_id, :venue, :user, :description, :fees, :duration, :start_date, :end_date
  validates_numericality_of :fees

  has_attached_file :logo,
                    :styles => {:large => "300x200#", 
                                :thumb => "100x100#", 
                                :medium => "65x65#", 
                                :mini => "40x40#", 
                                :micro => "30x30#" }, 
                    :default_url => "/assets/club_:style.png"
end
