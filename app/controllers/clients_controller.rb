class ClientsController < ApplicationController
  before_action :authentification, only: [:index, :new, :create]
  before_action :set_client, only: [:destroy]


  def index
    if @current_user.role =='Admin'
      @clients=Client.all
    elsif @current_user.role=='Customer'
      @clients=@current_user.clients
    end

  end

  def new
    @client=Client.new
  end

  # POST /user/client/new
  def create
    client = Client.new(user_params)
    client.user_id=@current_user.id
    client.oauth_secret = SecureRandom.base64(20)
    client.oauth_id = SecureRandom.base64(20)
    respond_to do |format|
      if client.save
        format.html { redirect_to user_clients_path, notice: 'The new client has been created.
The client id is ' + client.oauth_id + ' and the client secret is ' + client.oauth_secret}
        format.json {render json:
                                {
            'Client name': client.oauth_name,
            'Client id': client.oauth_id,
            'Client secret': client.oauth_secret
                                }
        }
      else
        format.html { render :new_client }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to user_clients_path, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def user_params
    params.permit(:oauth_name)

  end

  def set_client
    @client=Client.find_by id: params[:client_id]
  end

end