class AuthController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: { error: 'Please check credentials.'}
        end
    end

    def show
        token = request.headers[:Authorization].split(' ').last
        decoded_token = JWT.decode(token, 'Secret', true, { algorithm: 'HS256'})
        user_id = decoded_token[0]['object_id']
        user = User.find(user_id)
    
        if user
          render json: user
        else
          render json: { error: 'Invalid token.' }
        end
    end
end
