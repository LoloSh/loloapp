require 'digest/sha1'


class Admin::UsersController < ApplicationController
  before_action :authentification, only: [:index, :edit, :update, :users]
  before_action :authentification_admin, only: [:index, :edit, :update, :users]
  before_action :set_user, only: [ :edit, :update, :destroy]


  # GET /user
  # GET /user.json
  def index
  end

  # GET admin/user/users
  # GET admin/user/users
  def users
    @users =User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)


    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def logout
    session.clear
    redirect_to(root_path)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :surname, :email, :hashpw, :hashpw_confirmation,  :birthday, :role, :position)
    end

  def authentification_admin
    if @current_user.role !='Admin'
      respond_to do |format|
        format.html { return render :file => 'public/403.html', :status => :forbidden, :layout => true }
        format.json { return render json: {'Message':'You don;t have the right to access to these informations'} , :status => :forbidden}
      end

    end
  end

end
