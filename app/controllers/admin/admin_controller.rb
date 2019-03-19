class Admin::AdminController < ApplicationController
  def index
    @user = User.last(5).reverse

    @product = Product.last(5).reverse
<<<<<<< HEAD
    @foot_print = FootPrint.last(5).reverse
=======
    @foot_print = Footprint.last(5).reverse
>>>>>>> development
  end
end
