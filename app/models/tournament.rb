class Tournament < ActiveRecord::Base
  belongs_to :match_type
  belongs_to :level
  has_and_belongs_to_many :sponsors
  belongs_to :user

  has_attached_file :logo, 
                    :styles => {:large => "300x300>", 
                                :thumb => "100x100>", 
                                :medium => "65x65!", 
                                :mini => "40x40!", 
                                :micro => "30x30!" }, 
                    :default_url => "/assets/club_:style.png"
end
