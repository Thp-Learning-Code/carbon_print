class ProductController < ApplicationController

  def index
    @product= Product.all
  end

  def show
    @product = Product.find(params[:id])
      total = @product.tx_total
      total.round(2)


  end

end
