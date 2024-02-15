class SessionsController < ApplicationController
  def new
    # Rediriger vers la page d'accueil si l'utilisateur est déjà connecté
    redirect_to root_path if logged_in?
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to gossip_path, notice: "Vous êtes connecté !"
    else
      flash.now[:alert] = "Email ou mot de passe incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
