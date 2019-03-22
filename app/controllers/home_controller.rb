class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def index
    @product = Product.all
    page = Nokogiri::HTML(open("https://maconscienceecolo.com/knowledge-base/100-gestes-ecolos/"))
    n = rand(0..99)
    @tips = page.xpath('//*[@id="kb-article-content"]/ol/li')[n].text
    if user_signed_in? && current_user.town != nil
      url = "https://api.airvisual.com/v2/nearest_city?lat=#{current_user.latitude}&lon=#{current_user.longitude}&key=BbFES4LurEehNo6PR"
      url_two ='https://api.airvisual.com/v2/city?city=Paris&state=Ile-de-France&country=France&key=BbFES4LurEehNo6PR'

      @res = JSON.parse(@response).with_indifferent_access
        @aqius = @res[:data][:current][:pollution][:aqius]
        @res[:data][:current][:pollution][:mainus]
        @city = @res[:data][:city]
        @country = @res[:data][:country]
        @state = @res[:data][:state]
        puts "*"*90
    end
    end
end
