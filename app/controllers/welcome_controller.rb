class WelcomeController < ApplicationController
  # Always select the parameters, never trust others users from the internet.
  before_action :user_params, only: [:login]

  # Empty action. A view is associated to this.
  # GET URL
  def index

  end

  # Action called by a post on URL/login
  def login
    email=params[:email]
    password=params[:password]
    #user = User.login_hash(email,password)
    user = User.find_by_email_and_hashpw(email,password)
    if user != nil && user.role=="Admin"
      set_session(user)
      redirect_to admin_user_path

    elsif user != nil && user.role=="Customer"
      set_session(user)
      redirect_to user_path

    else
      @error='No user matching these informations.'
      render "welcome/index"
    end
  end



  private

  # Define the current user of the app by the session
  def set_session(user)
    session[:id] = user.id
  end



  def user_params
    params.permit(:email, :password)
  end

end
