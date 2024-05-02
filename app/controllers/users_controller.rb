class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Inscription réussie !"
    else
      flash[:error] = "L'adresse e-mail existe déjà ou le formulaire contient des erreurs."
      redirect_to new_user_path   
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :city_id, :password, :password_confirmation)
  end

end
