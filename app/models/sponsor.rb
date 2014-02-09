class Sponsor < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tournaments

  validates_presence_of :name

  has_attached_file :logo, 
                    :styles => {:large => "240\>x60\>", 
                                :thumb => "100x100#", 
                                :medium => "65x65#", 
                                :mini => "40x40#", 
                                :micro => "30x30#" }, 
                    :default_url => "/assets/club_:style.png"

end
