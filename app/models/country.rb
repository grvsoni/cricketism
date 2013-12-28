class Country < ActiveRecord::Base
  has_many :profiles
  has_many :states
  belongs_to :user

  validates :name, :uniqueness => true, :presence => true
end
