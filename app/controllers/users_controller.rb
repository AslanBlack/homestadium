class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        flash[:notice] = "Votre compte a été supprimé."
        redirect_to root_path
    end
  end
  
  
end