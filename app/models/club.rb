class Club < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
  has_many :teams, :dependent => :destroy
  has_many :players
  has_many :club_requests
  validates :name, :city, :state, :country, :presence => true
  validates :name, :uniqueness => true

  has_attached_file :logo, 
                    :styles => {:large => "300x200#", 
                                :thumb => "100x100#", 
                                :medium => "65x65#", 
                                :mini => "40x40#", 
                                :micro => "30x30#" }, 
                    :default_url => "/assets/club_:style.png"

  before_destroy :unbind_players

  def unbind_players
    self.players.each do |player|
      player.update_attribute(:club_id, nil)
      player.update_attribute(:team_id, nil)
    end
  end
end
