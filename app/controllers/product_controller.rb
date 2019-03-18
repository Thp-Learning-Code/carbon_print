class ProductController < ApplicationController
  def index
    @product= Product.all
    @response = open('https://api.airvisual.com/v2/city?city=Paris&state=Ile-de-France&country=France&key=QNrwyZP6F7oa3Bxog').read 
    @status = "status"
    puts "*"*90
    puts @response.to_json
     @res = JSON.parse(@response).with_indifferent_access
     puts "ù"*90
     puts @res[:data][:current][:pollution][:aqius]
     puts @res[:data][:current][:pollution][:mainus]
    #  puts @res
    puts "*"*90

  end

  def show
    @product = Product.find(params[:id])
  end
  
end
