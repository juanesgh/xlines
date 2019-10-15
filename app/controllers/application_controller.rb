class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken

    protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }  
    #para usar el de arriba cambiar API a  Base
    #protect_from_forgery with: :exception
    before_action :authenticate_user!, except: :sign_in
    

end
