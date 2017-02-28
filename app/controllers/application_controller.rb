class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
    def authentification
      p ' yatangaki'
      content = request.authorization.to_s.split(' ')
      token= content[1]
      if  !token.nil?
        get_oauth(token)

      elsif  !User.find_by_id(session[:id]).nil?
        p ' yatangaki 222222'
        get_session
        p ' yatangaki 333333333333'

      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Try to log in before doing anything' }
          format.json {render json:{'Message': 'No authentification token found'}, status: :unauthorized}
        end


      end

    end



    def get_session
      p ' 12'

      @current_user = User.find_by_id(session[:id])
      p ' 32321312123123231123123231123123'
      p @current_user

    end



    def get_oauth(token)

      tokenDB= AccessToken.find_by access_token: token
      p ' yaaaaaaaaaaaaaaaaa la chancla 33333333'

      if tokenDB.nil?
        respond_to do |format|


          format.json{ render json: {'Message':'This token does not exist.'}, status: :unauthorized}
        end

      elsif tokenDB.validity_time < DateTime.now
        respond_to do |format|
          format.json{return render json: {'Message': 'This token has expired'}, status: :unauthorized}
        end
      else
        client= Client.find_by id: tokenDB.client_id
        @current_user =User.find_by id: client.user_id




      end
    end


end
