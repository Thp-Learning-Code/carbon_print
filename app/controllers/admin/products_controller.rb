class Admin::ProductsController < ApplicationController
  before_action :authorize_admin

  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      
    end
  end

  def edit
  end

  def update
  end
end
