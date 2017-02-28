require 'securerandom'

class Oauth::TokenController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    grant_type=params[:grant_type]

      if grant_type=='client_credentials'
        ask_for_token


      elsif grant_type=='refresh_token'

        refresh

      elsif grant_type.nil?
        p grant_type
        respond_to do |format|


          format.json { render json: {'Message':'No indicated grand type'}, status: :bad_request }
        end
      else
        respond_to do |format|

          format.json { render json: {'Message':'Wrong grant type'}, status: :bad_request }

        end
      end
  end




  private


  def ask_for_token
    @client= Client.find_by oauth_id: params[:client_id], oauth_secret: params[:client_secret]

    if @client.nil?
      respond_to do |format|
        format.json { return render json: {}, status: :unauthorized }
        end
    end
    respond_to do |format|
    access_token=AccessToken.find_by client_id: @client.id


    if @client.nil?
      format.json { render json: {}, status: :forbidden }

    elsif RefreshToken.find_by client_id: @client.id
      if access_token.validity_time>DateTime.now
      access_token=AccessToken.find_by client_id: @client.id


      refresh_token=RefreshToken.find_by client_id: @client.id
      format.json { render json: { 'user_id': access_token.user_id,
                                   'access_token':  access_token.access_token,
                                   'refresh_token': refresh_token.refresh_token}, status: :ok }


      elsif access_token.validity_time<DateTime.now


        tokenDB= RefreshToken.find_by client_id: @client.id
        accessToken = AccessToken.find_by user_id: tokenDB.user_id
        access_token=update_access_token(accessToken)
        response={'user_id':access_token.user_id , 'access_token': access_token.access_token, 'refresh_token':tokenDB.refresh_token}
        format.json { render json: response}

      end


    else

      access_token=new_access_token(@client.id,@client.user_id)
      refresh_token=new_refresh_token(@client.id,@client.user_id)

      response={'user_id':access_token.user_id , 'access_token': access_token.access_token, 'refresh_token':refresh_token.refresh_token}


      format.json { render json: response}

    end
    end

  end


  def refresh
    token = params[:refresh_token]
    oauth_id=params[:client_id]

    client_id = Client.find_by oauth_id: oauth_id
    tokenDB= RefreshToken.find_by refresh_token: token, client_id: client_id.id
    respond_to do |format|
      if tokenDB.nil?
        format.json{ render json: {'Message': 'This refresh token does not exist'}, status: :unauthorized}
      else
        accessToken = AccessToken.find_by user_id: tokenDB.user_id
        access_token=update_access_token(accessToken)

        response={'new access_token': access_token.access_token}


        format.json { render json: response}



      end
    end
  end






  def new_access_token(client_id,user_id)
    access_token=AccessToken.new
    access_token.access_token=SecureRandom.base64(30)
    access_token.client_id=client_id
    access_token.validity_time=1.hour.from_now
    access_token.user_id=user_id
    access_token.save


    return access_token



  end


  def update_access_token(current_token)
    access_token=current_token
    access_token.update( :access_token => SecureRandom.base64(30))
    access_token.update( :validity_time =>1.hour.from_now )
    return access_token

  end

  def new_refresh_token(client_id,user_id)
    refresh_token=RefreshToken.new
    refresh_token.refresh_token=SecureRandom.base64(30)
    refresh_token.client_id=client_id
    refresh_token.user_id=user_id
    refresh_token.save

    return refresh_token

  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:grant_type, :client_id, :client_secret)
  end

end