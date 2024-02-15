class LikesController < ApplicationController
    def create
      @gossip = Gossip.find(params[:gossip_id])
      if current_user
        Like.create(gossip: @gossip, user: current_user)
        @gossip.update(likes_count: @gossip.likes.count)
        redirect_to @gossip, notice: "Gossip liked successfully."
      else
        redirect_to @gossip, alert: "Please log in to like this gossip."
      end
    end
  
    def destroy
      @gossip = Gossip.find(params[:gossip_id])
      if current_user
        like = @gossip.likes.find_by(user: current_user)
        like.destroy if like
        @gossip.update(likes_count: @gossip.likes.count)
      end
      redirect_to @gossip
    end
  end
  
