class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @foot_print = FootPrint.where(:user_id => @user.id)
  end
end
