class ApplicationController < ActionController::Base
    before_action :set_current_user

    private
  
    def set_current_user
      @current_user = User.find_by(id: session[:user_id]) if session[:user_id].present?
    end
  
    # Définir la méthode current_user pour qu'elle soit accessible depuis les vues
    helper_method :current_user
    def current_user
      @current_user
    end
end
