class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :username
  validates_uniqueness_of :username

  has_one :profile, :dependent => :destroy
  has_and_belongs_to_many :roles
  belongs_to :user

  before_save :set_user_roles

  attr_accessor :role_ids

  def name
    profile.present? ? profile.fullname : username
  end

  def has_role?(role)
    roles.include?(role)
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
