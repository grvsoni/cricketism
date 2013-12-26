class AddressController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def states
    @profile = current_user.profile.present? ? current_user.profile : Profile.new({:user_id => current_user.id})
    render(:partial => "shared/state_select", :locals => {:parent_country => params[:id]})
  end

  def cities
    @profile = current_user.profile.present? ? current_user.profile : Profile.new({:user_id => current_user.id})
    render(:partial => "shared/city_select", :locals => {:parent_region => params[:id]})
  end
end
