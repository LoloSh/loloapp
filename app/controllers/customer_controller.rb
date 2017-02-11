class CustomerController < ApplicationController
  def new
    @user = User.new
  end





  def create
    p "++++++++"
    @user = User.new(user_params)
    @user.role="Customer"

    respond_to do |format|
      if @user.save
        format.html { render 'welcome/index' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end