class Level < ActiveRecord::Base
  has_many :clubs 
  belongs_to :user

  validates :level, :uniqueness => true, :presence => true
end
