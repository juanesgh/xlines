# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  #skip_before_action :authenticate_user!

  # Be sure to enable JSON.
  #respond_to :html, :json
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # # POST /resource/sign_in
    # def create
    #   super do |user|
    #     session[:token] = true
    #   end
    # end
  # #      user = User.where(email: params[:email]).first
              
  # #      if user&.valid_password?(params[:password])
  # #        render json: user.as_json(only: [:email, :authentication_token]), status: :created
  # #        #session log in devise
  # #      else
  # #        render json: "No es posible?"
        
  # #        #head(:unauthorized)
  # #      end
  #       self.resource = warden.authenticate!(auth_options)
  #       set_flash_message(:notice, :signed_in) if is_flashing_format?
  #       sign_in(resource_name, resource)
  #       yield resource if block_given?

  #       respond_with resource, location: after_sign_in_path_for(resource) do |format|
  #         format.json { render json: {user_email: resource.email, access_token: resource.access_token} }
  #       end
  #   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
