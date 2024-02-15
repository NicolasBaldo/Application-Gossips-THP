class CommentsController < ApplicationController
  def new 
    @comment = Comment.new 
  end

  def index 
    @comments = Comment.all
  end

  def create
    @content = params["content"]
    @author = params["author"]
    @gossip_id = params["gossip_id"]
    @gossip = Gossip.find(params[:gossip_id])
    @user = User.find_or_initialize_by(first_name: @author)

if @user.new_record?
 @user.save(validate: false)
end

    
    @comment = Comment.new(user: @user, content: @content, gossip: @gossip)
    
    if @comment.save
      redirect_to gossips_path, notice: "Commentaire validé!"
    else
      # Gérer le cas où le commentaire n'a pas pu être sauvegardé
    end
  end
  

  def show
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end
end

