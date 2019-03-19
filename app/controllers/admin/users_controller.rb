class Admin::UsersController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success]="User Deleted"
      redirect_to admin_root_path
    end
  end
end
