class UsersController < ApplicationController

  def index
    @users = User.all 
  end

  def new 
    @user = User.new
  end
    
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
 
  def show
    return redirect_to '/' unless session.include? :user_id
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets,:height, :admin)
  end

  def home 

  end
end
