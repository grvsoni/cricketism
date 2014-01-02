class TeamsController < ApplicationController
  layout "dashboard"
  
  set_tab :dashboard
  set_tab :teams, :subnav

  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    if params[:user_id].present?
      @teams = Team.where("user_id = #{params[:user_id]}")
    elsif params[:club_id].present?
      @teams = Team.where("club_id = #{params[:club_id]}")
    else
      @teams = Team.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    params[:team] = params
    @team = Team.new(team_params)
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html do
          flash[:notice] = 'Team was successfully created.'
          current_user.is_admin? ? (redirect_to teams_path) : (redirect_to user_teams_path(current_user))
        end
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :user_id, :club_id, :active)
    end
end
