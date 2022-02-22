class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id 
        render json: user, status: :created
    end

    def show
        user = User.find(session[:user_id])
        render json: user
    end

    # def show
    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    #         render json: user
    #     end
    # end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :bio, :image_url)
    end
end
