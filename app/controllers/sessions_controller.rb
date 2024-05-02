class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path, notice: "Connexion réussie!"

        else
        flash.now[:danger] = 'Adresse email ou mot de passe incorrect'
        render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        session.delete(:user_id)
        redirect_to new_user_path, notice: "Déconnexion réussie !"
    end
 
end
