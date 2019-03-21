class ProductController < ApplicationController
  def index
    @product= Product.all
  end

  def show
    @product = Product.find(params[:id])
    
    if @product.result == nil 
      @product.result = @product.tx_total
      @product.save
    else 
      @product.result
    end
    
  end
  
end
