class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @foot_print = FootPrint.where(:user_id => @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success]="User Deleted"
      redirect_to admin_root_path
    end
  end
end
