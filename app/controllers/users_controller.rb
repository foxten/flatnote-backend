class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: { error: 'Please check credentials.'}
        end
    end

 
    # def create
    #     @user = User.create(user_params)
    #     if @user.valid?
    #     @token = encode_token(user_id: @user.id)
    #     render json: user
    #     else
    #     render json: { error: 'failed to create user' }, status: :not_acceptable
    #     end
    # end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end

    # def edit
    #     user = User.find(params[:id])
    # end

    # def update
    #     user = User.find(params[:id])
    #     user.update(username: params[:newUsername])
    #     render json: user, include: :notes
    # end

    # def destroy
    #     user = User.find(params[:id])
    #     user.destroy
    #     render json: user
    # end

    # private
    # def user_params
    #     params.require(:user).permit(:username, :password)
    # end
end
    