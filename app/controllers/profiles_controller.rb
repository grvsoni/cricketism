class ProfilesController < ApplicationController
  layout :profile_layout

  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new({:user_id => current_user.id})
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find_by_id(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html do 
          flash[:notice] = 'Profile was successfully created.'
          redirect_to (current_user.is_admin? || current_user.is_club_admin?) ? users_path : edit_profile_path(current_user.profile.id)
        end
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html do
          flash[:notice] = 'Profile was successfully updated.'
          redirect_to (current_user.is_admin? || current_user.is_club_admin?) ? users_path : edit_profile_path(current_user.profile.id)
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :firstname, :lastname, :dob, :street, :city_id, :state_id, :country_id, :height, :weight, :user_id)
    end

    def profile_layout
      if params[:id].present?
        if current_user.profile.present? && current_user.profile.id == params[:id].to_i
          set_tab :profile, :subnav
          "account"
        else
          "dashboard"
        end
      else
        set_tab :profile, :subnav
        "account"
      end
    end
end
