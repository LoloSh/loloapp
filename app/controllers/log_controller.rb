class LogController < ApplicationController
  after_action :set_session
  def login
    email=params[:email]
    password=params[:password]
    @user = User.login_hash(email,password)
   # @user = User.find_by_email_and_hashpw(email,password)
    if @user != nil && @user.role=="Admin"

      redirect_to admin_users_path

      elsif @user != nil && @user.role=="Customer"


      redirect_to users_path

    else
      @error='No user matching these informations.'
      render "welcome/index"
    end
  end

  private

  def set_session
    session[:id] = @user.id
  end


end