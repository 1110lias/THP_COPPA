class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy update_admin_status]
  before_action :authenticate_user!
  before_action :correct_user_or_admin, only: %i[show edit update destroy update_admin_status]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @orders = @user.orders
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: '' }
        format.json { render :show, status: :created, location: @user }
        flash[:success] = "L'utilisateur a été créé avec succès !"
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Le profil a été modifié avec succès.'
    else
      render :edit
    end
  end

  # PATCH /users/1/update_admin_status
  def update_admin_status
    if @user.last_admin? && params[:user][:isadmin] == "0"
      redirect_to @user, alert: 'Cannot remove admin status from the last admin.'
    elsif @user.update(admin_status_params)
      redirect_to @user, notice: 'Admin status was successfully updated.'
    else
      redirect_to @user, alert: 'Failed to update admin status.'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if current_user.isadmin? || @user == current_user
      if @user.last_admin?
        redirect_to users_url, alert: 'Cannot delete the last admin.'
      else
        @user.destroy!
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    else
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :billing_address, :delivery_address, :isadmin)
  end

  def admin_status_params
    params.require(:user).permit(:isadmin)
  end

  def correct_user_or_admin
    unless @user == current_user || current_user.isadmin?
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
