class CommentsController < ApplicationController
    before_action :find_gossip
  
    def create
      @comment = @gossip.comments.build(comment_params)
      @comment.user = current_user
      
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
      @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      if @comment.update(comment_params)
        flash[:success] = "Votre commentaire a bien été modifié."
        redirect_to gossip_path(@gossip)
      else
        flash[:error] = "Nous n'avons pas réussi à modifier le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.join(" , ")}"
        render :edit
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
  
