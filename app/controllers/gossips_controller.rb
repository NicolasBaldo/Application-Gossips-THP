class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @comments = @gossip.comments
  end
  

  def edit
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à modifier ce potin."
    end
  end
  def update 
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title , :content)
    @gossip.update(post_params)
    redirect_to gossip_path
  end

  def new 
    @gossip = Gossip.new 
  end

  def create
     
    @content = params["content"]
    @title = params["title"]
    @author = params["author"]
    
    @user = User.find_or_create_by(first_name: @author)

    
    @gossip = Gossip.new(user: @user,content: @content,title: @title)
    if @gossip.save
      redirect_to gossips_path, notice: "Gossip créé avec succès!"
    else
      render :new
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: "Potin supprimé avec succès !"
  end

  def index
    @gossips = Gossip.all
  end
  def like
    @gossip = Gossip.find(params[:id])
    if current_user
      @gossip.likes.create(user: current_user)
      @gossip.increment!(:likes_count)
    end
    render :show
  end

  def unlike
    @gossip = Gossip.find(params[:id])
    if current_user
      like = @gossip.likes.find_by(user: current_user)
      like.destroy if like
      @gossip.decrement!(:likes_count)
    end
    render :show
  end

end

