class Level < ActiveRecord::Base
  has_many :clubs 
  belongs_to :user

  validates :name, :uniqueness => true, :presence => true
end
