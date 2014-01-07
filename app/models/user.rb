class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :username
  validates_uniqueness_of :username

  has_one :profile, :dependent => :destroy
  has_one :player, :dependent => :destroy
  has_and_belongs_to_many :roles
  belongs_to :user
  has_many :clubs
  has_many :players, :through => :clubs

  before_save :set_user_roles

  accepts_nested_attributes_for :player, :allow_destroy => "true"

  attr_accessor :role_ids

  class << self
    def all_players
      Role.find_by_name("Player").users
    end

    def all_club_admins
      Role.find_by_name("Club Admin").users
    end
  end

  def name
    profile.present? ? profile.fullname : username
  end

  def has_role?(role)
    roles.include?(role)
  end

  def is_admin?
    roles.include?(Role.find_by_name("Admin"))
  end

  def is_club_admin?
    roles.include?(Role.find_by_name("Club Admin"))
  end

  def is_player?
    roles.include?(Role.find_by_name("Player"))
  end

  def is_umpire?
    roles.include?(Role.find_by_name("Umpire"))
  end

  def is_thrid_umpire?
    roles.include?(Role.find_by_name("Third Umpire"))
  end

  def is_fourth_official?
    roles.include?(Role.find_by_name("Fourth Official"))
  end

  def is_match_referee?
    roles.include?(Role.find_by_name("Match Referee"))
  end

  def is_scorer?
    roles.include?(Role.find_by_name("Scorer"))
  end

  def is_groundsman?
    roles.include?(Role.find_by_name("Groundsman"))
  end

  def set_user_roles
    if self.role_ids.present?
      roles.destroy_all
      self.role_ids.each do |role_id|
        roles << Role.find_by_id(role_id)
      end
    end
  end
end
