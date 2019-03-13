class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def index
    @product = Product.all
    page = Nokogiri::HTML(open("https://maconscienceecolo.com/knowledge-base/100-gestes-ecolos/"))
    n = rand(0..99)

    @tips = page.xpath('//li')[n]


# unless <li>
#   supprimer <li>
# end
#
#
# unless https
#   @tips = page.xpath('//*[@id="kb-article-content"]/ol/li[73]/span/a/text()')[n]
  end


end
