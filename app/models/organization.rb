class Organization < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :is_active
end
