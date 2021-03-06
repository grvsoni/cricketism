class PlayersController < ApplicationController
  layout :player_layout
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    puts "current_user >>>>>>> #{current_user.reload.players}"
    @players = current_user.is_club_admin? ? current_user.players : Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @user = User.new
    @user.build_player
    @player = @user.player
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
    @user = @player.user
  end

  # POST /players
  # POST /players.json
  def create
    if params[:player].present?
      @player = Player.create(player_params)
      respond_to do |format|                             
        if @player && @player.errors.blank?
          format.html do
            flash[:notice] = 'Player was successfully created.'
            redirect_to (current_user.is_admin? || current_user.is_club_admin?) ? players_path : edit_player_path(current_user.player.id)
          end
          format.json { head :no_content }
        else
          format.html { render action: 'existing_user' }
          format.json { render json: @player.errors, status: :unprocessable_entity }
        end
      end
    else
      puts ">>>>>>>> via club admin...."
      @user = User.create(user_params)
      @player = @user.player
      respond_to do |format|                             
        if @user && @user.errors.blank?
          format.html { redirect_to users_path, notice: "#{Role.find(user_params[:role_ids][0]).name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
    
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    @user = @player.user
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to edit_player_path(@user.player.id), notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  def existing_user
    @player = Player.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:batting_hand, :bowling_hand, :skill, :batting_style, :bowling_style, :is_wicketkeeper, :club_id, :team_id, :user_id)
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_id, :player_attributes => [:batting_hand, :bowling_hand, :skill, :batting_style, :bowling_style, :is_wicketkeeper, :club_id, :team_id], :role_ids => [])
    end

    def player_layout
      if params[:id].present?
        if current_user.player.present? && current_user.player.id == params[:id].to_i
          set_tab :players, :subnav
          "account"
        else
          "dashboard"
        end
      else
        set_tab :players, :subnav
        "dashboard"
      end
    end
end
