class SessionsController < ApplicationController
    def create
        user = User.where(email: params[:email]).first
        
        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [:email, :authentication_token]), status: :created
            #session log in devise
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_user.update_atributte(:authentication_token, nil)
        render json: :ok
    end
end