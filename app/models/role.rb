class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin, :class_name => "User", :foreign_key => "user_id"
  has_and_belongs_to_many :users

  validates :name, :uniqueness => true, :presence => true

  class << self
    def login_roles
      Role.where("login_role = 1")
    end
  end
end
