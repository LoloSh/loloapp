class CustomerController < ApplicationController
  def new
    @user = User.new
  end





  def create
    @user = User.new(user_params)
    @user.role="Customer"

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root_path, notice: 'Your account was successfully created. You can log in now.'  }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end