class PagesController < ApplicationController
  def team
  end
  def contact
  end
  def welcome
    @first_name = params[:first_name]
  end
  def home
    @gossips = Gossip.all

  end
 def show 
  @gossip = Gossip.find(params[:id])
 end
end