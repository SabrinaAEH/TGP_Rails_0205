class GossipsController < ApplicationController
  def home
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    # Création d'un nouveau potin avec les paramètres du formulaire
    @gossip = Gossip.new(gossip_params)
  
    # Association du potin à l'utilisateur "anonymous"
    anonymous = User.find_by(first_name: "anonymous")
    @gossip.user = anonymous
  
    if @gossip.save
      flash[:success] = "Le potin a été créé avec succès !"
      redirect_to home_path
    else
      flash[:error] = "Erreur lors de la création du potin. Veuillez vérifier les informations : #{@gossip.errors.full_messages.join(", ")} "
      redirect_to new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = "Le potin a été mis à jour avec succès !"
      redirect_to gossip_path(@gossip)
    else
      flash[:error] = "Erreur lors de la mise à jour du potin. Veuillez vérifier les informations."
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    
    flash[:success] = "Le potin a été supprimé avec succès !"
    redirect_to home_path
  end

  private
  
  def gossip_params
    params.require(:gossip).permit(:title, :description)
  end

end 
