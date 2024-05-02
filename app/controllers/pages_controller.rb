class PagesController < ApplicationController
  before_action :authenticate_user, only: [:team, :contact, :home] 

  def team
  end

  def contact
  end

  def home
    @gossips = Gossip.all
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Merci de vous inscrire ou de vous connecter."
      redirect_to new_user_path
    end
  end

end
