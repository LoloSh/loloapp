class PetsController < ApplicationController
  # Always identify the user before doing any action, authentification is inherited from ApplicationController
  before_action :authentification, only: [:index, :new, :create, :update, :edit, :destroy]
  # Select the parameter in the URL to identify the pet selected
  before_action :set_pet, only: [:edit, :update, :destroy]




  # GET user/pets
  # GET user/pets.json
  # Show the list of pets of the user. No code in the action.
  def index
    @pets=@current_user.pets
  end

  # GET users/pets/new
  # To get to the form  for creating a new pet.
  def new
    @pet = Pet.new
  end


  # POST users/pets
  # POST users/pets
  # Create the new pet
  def create
    pet=Pet.new(user_params)
    pet.user_id=@current_user.id

    if pet.save
      respond_to do |format|
        format.html { redirect_to user_pets_path, notice: 'You have successfully added a new pet.' }
      end
    end

  end

  # PATCH/PUT /users/pets/1
  # PATCH/PUT /users/pets/1.json
  # Update the informations about the pet selected
  def update
    respond_to do |format|
      if @pet.update(user_params)
        format.html { redirect_to user_pets_path, notice: 'You have successfully changed the name of your pet.'}
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /users/pets/1/edit
  # To get to the form  for editing a new pet.
  def edit
  end

  # DELETE /users/pets/1
  # DELETE /users/pets/1.json
  # To destroy the pet selected
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to user_pets_path, notice: 'You deleted one of your pet' }
      format.json { head :no_content }
    end

  end


  # Methods which can be used outside of the controller
  private

  # Identify the pet selected  with the help of the URL
  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  # Filter the paramaters
  def user_params
    params.require(:pet).permit(:name, :race)
  end



end