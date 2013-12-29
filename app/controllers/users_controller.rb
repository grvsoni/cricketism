class UsersController < ApplicationController
  layout "dashboard"
  set_tab :dashboard

  before_action :set_club, only: [:edit, :update, :destroy]

  def index
    set_tab :users, :subnav
    @users = User.all
  end

  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    
    successfully_updated = false

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
    
    respond_to do |format|                             
      if successfully_updated
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!
 
    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { redirect_to users_path, notice: 'User was successfully deleted.' }      
    end
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_id, :role_ids => [])
    end

    def needs_password?(user, params)
      params[:password].present?
    end
end
