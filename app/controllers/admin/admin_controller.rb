class Admin::AdminController < ApplicationController
  def index
    @user = User.all
    @product = Product.all
    @foot_print = FootPrint.all
  end
end
