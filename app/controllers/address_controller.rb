class AddressController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def states
    
  end

  def cities
  end
end
