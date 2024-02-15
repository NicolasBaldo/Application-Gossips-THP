class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @first_name = params["first_name"]
    @last_name = params["last_name"]
    @email = params["email"]
    @password = params["password"]
    @password_confirmation = params["password_confirmation"]
  
   
    @user = User.find_or_create_by(first_name: @first_name, last_name: @last_name, email: @email)
    @user.password = @password
    @user.password_confirmation = @password_confirmation
  
    if @user.save
      redirect_to root_path, notice: "User successfully created!"
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  def index 
    @users = User.all
  end
end

 
