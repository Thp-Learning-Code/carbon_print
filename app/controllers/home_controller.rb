class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'open_http'
  def index
    @product = Product.all
    page = Nokogiri::HTML(open("https://maconscienceecolo.com/knowledge-base/100-gestes-ecolos/"))
    n = rand(0..99)
    @tips = page.xpath('//*[@id="kb-article-content"]/ol/li')[n].text
    if user_signed_in?
<<<<<<< HEAD
      url = "https://api.airvisual.com/v2/nearest_city?lat=#{current_user.latitude}&lon=#{current_user.longitude}&key=QNrwyZP6F7oa3Bxog"
      url_two ='https://api.airvisual.com/v2/city?city=Paris&state=Ile-de-France&country=France&key=QNrwyZP6F7oa3Bxog'
      puts @response = open(url).read 
      puts current_user.latitude
      # puts "*"*90
      # puts @response.to_json
      @res = JSON.parse(@response).with_indifferent_access
        @aqius = @res[:data][:current][:pollution][:aqius]
        @res[:data][:current][:pollution][:mainus]
        @city = @res[:data][:city]
        @country = @res[:data][:country]
        @state = @res[:data][:state]
        puts "*"*90
=======
    puts @response = open("https://api.airvisual.com/v2/nearest_city?lat=#{current_user.latitude}&lon=#{current_user.longitude}&key=QNrwyZP6F7oa3Bxog").read 
    #'https://api.airvisual.com/v2/city?city=Paris&state=Ile-de-France&country=France&key=QNrwyZP6F7oa3Bxog'
    # puts current_user.latitude
    # puts "*"*90
    # puts @response.to_json
    @air_key = ENV['AIR_QUALITY']
     @res = JSON.parse(@response).with_indifferent_access
      @aqius = @res[:data][:current][:pollution][:aqius]
      @res[:data][:current][:pollution][:mainus]
      @city = @res[:data][:city]
      @country = @res[:data][:country]
      @state = @res[:data][:state]
      puts "*"*90
>>>>>>> 3c7f4c6f6883b1aae3e4d54a04d9eddcfe4c4fde
    end
    end
end
