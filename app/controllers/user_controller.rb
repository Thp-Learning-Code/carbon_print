class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @foot_print = Footprint.where(:user_id => params[:id])
  end
end
