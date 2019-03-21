class ProductController < ApplicationController
  def index
    @product= Product.all
  end

  def show
    @product = Product.find(params[:id])
    @product.result = @product.tx_total
  end
end
