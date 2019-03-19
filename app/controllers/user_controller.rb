class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    @foot_print = Footprint.where(:user_id =>@user.id)
=======
    @foot_print = Footprint.where(:user_id => params[:id])
>>>>>>> 48cad2beb7e3d9b528e81952e47540f95f1e028a
  end
end
