class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  belongs_to :state
  belongs_to :city

  include Address

  validates :firstname, :lastname, :dob, :presence => true

  has_attached_file :avatar, 
                    :styles => {:large => "300x300>", 
                                :thumb => "100x100>", 
                                :medium => "65x65!", 
                                :mini => "40x40!", 
                                :micro => "30x30!" }, 
                    :default_url => "/assets/user_:style.jpeg"

  def fullname
    [firstname, lastname].join(" ")
  end
end
