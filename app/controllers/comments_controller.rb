class CommentsController < ApplicationController
    before_action :find_gossip
  
    def create
      @comment = @gossip.comments.build(comment_params)
      anonymous = User.find_by(first_name: "anonymous")
      @comment.user = anonymous
      
      if @comment.save
        flash[:success] = "Commentaire ajouté avec succès."
      else
        flash[:error] = "Erreur lors de l'ajout du commentaire."
      end
      redirect_to @gossip
    end
  
    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update()
      id = params[:id]
      @comment = Comment.find(id)
      puts "Voici mon comment : #{@comment}"
      @comment.update(description: params[:description])
      if @comment.save
          redirect_to "/gossips/#{@comment.gossip_id}"
          flash[:success] = "Votre commentaire a bien été modifié"
      else
          redirect_to "/gossips/edit"
          flash[:error] = "Nous n'avons pas réussi à modifier le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.join(",")}"
      end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = "Commentaire supprimé avec succès."
        redirect_to @gossip
      end
      
    private
  
    def find_gossip
      @gossip = Gossip.find(params[:gossip_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  
