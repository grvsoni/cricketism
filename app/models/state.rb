class state < ActiveRecord::Base
  set_table_as "regions"
  
  has_many :profiles
end