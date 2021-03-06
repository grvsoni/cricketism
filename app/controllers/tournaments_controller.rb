class TournamentsController < ApplicationController
  set_tab :dashboard
  set_tab :tournaments, :subnav

  load_and_authorize_resource
  
  layout "dashboard"
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    if params[:user_id].present?
      @tournaments = Tournament.where("user_id = #{params[:user_id]}")
    else
      @tournaments = Tournament.all
      respond_to do |format|
        format.html { render :tournaments }
        format.json { render action: 'show', status: :created, location: @tournament }
      end
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    render :layout => "tournament"
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tournament }
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :match_type_id, :level_id, :user_id, :logo, :venue_id, :description, :fees, :duration, :start_date, :start_time, :end_date, :end_time, :sponsor_ids => [])
    end
end
